import java.io.File

fun getFuncByName(name: String):((Int)->Int) = Main().getFuncByName(name)

fun executeFunction(fname: String, arg: Int): Int = getFuncByName(fname)(arg)

fun runTask6(args: Array<String>) {
    if (args.count() < 2) {
        println("Пожалуйста, укажите полный путь к входному и выходному файлам в командной строке")
        return
    }

    val fileIn = File(args[0].trim('"', '\'', ' ')).canonicalFile
    if (!fileIn.exists()) {
        println("Файл $fileIn не существует")
        return
    }

    val fileOut = File(args[1].trim('"', '\'', ' ')).canonicalFile

    try {
        println("Чтение файла $fileIn")
        var curLine = 0
        val results = ArrayList<String>()
        fileIn.forEachLine {
            curLine++
            val line = it.trim().split("\\s+".toRegex())
            val func = line.last()
            if (func.isNotEmpty()) {
                try {
                    val num = line.first().toInt()
                    val result = executeFunction(func, num)
                    results.add("${num} $func $result")
                }
                catch (ex: NumberFormatException) {
                    throw Exception("Ошибка во входных данных (строка $curLine): ${ex.message!!.split('"')[1]} не является целым числом")
                }
                catch (ex: NullPointerException) {
                    throw Exception("Ошибка во входных данных (строка $curLine): неверное название функции: $func")
                }
                catch (ex: ArrayIndexOutOfBoundsException) {
                    throw Exception("Ошибка во входных данных (строка $curLine): недостаточно аргументов для функции $func")
                }
            }
        }
        println("Запись в файл $fileOut")
        fileOut.writeText(results.joinToString("\n"))
        println("Готово")
    }
    catch (ex: Exception) {
        println(ex.localizedMessage)
    }
}