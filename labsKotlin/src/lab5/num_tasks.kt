import java.lang.System.`in`
import java.util.*
import kotlin.math.*
class Main {
    //максимум из 3
    fun max3(x: Int, y: Int, z: Int): Int = if (x > y) if (x > z) x else z else if (y > z) y else z

    //факториал вверх
    fun factup(n: Int): Int = if (n <= 1) 1 else factup(n - 1) * n

    //факториал вниз
    tailrec fun factd(n: Int, a: Int): Int = if (n <= 1) n * a else factd(n - 1, n * a)
    fun factdown(n: Int): Int = factd(n, 1)

    //сумма цифр вниз
    fun sumcda(n: Int, a: Int): Int = if (n < 10) n + a else sumcda(n / 10, a + (n % 10))
    fun sumcd(n: Int): Int = sumcda(n, 0)

    //сумма цифр вверх
    fun sumc(n: Int): Int = if (n < 10) n else (n % 10) + sumc(n / 10)

    //произведение цифр вверх
    fun mulc(n: Int): Int = if (n < 10) n else (n % 10) * mulc(n / 10)

    //функция высшего порядка возвращает функцию
    fun calc(f: Boolean): (Int) -> Int = if (f) ::sumc else ::mulc

    //функция высшего порядка принимает функцию
    tailrec fun digits(n: Int, a: Int = 0, f: (Int, Int) -> Int): Int =
        if (n == 0) a else digits(n / 10, f(a, n % 10), f)

    //вызовы через лямбды
    fun sumd(n: Int): Int = digits(n, 0) { a, b -> (a + b) }
    fun muld(n: Int): Int = digits(n, 1) { a, b -> (a * b) }
    fun maxd(n: Int): Int = digits(n / 10, n % 10) { a, b -> if (a > b) a else b }
    fun mind(n: Int): Int = digits(n / 10, n % 10) { a, b -> if (a < b) a else b }

    //Максимальная цифра в числе рекурсией вверх
    fun maxDigitUp(n: Int): Int{
        if (n==0) return 0
        else return max(abs(n%10), maxDigitUp(n/10))
    }

    //Максимальная цифра в числе рекурсией вниз
    fun maxDigitDown(n: Int): Int{
        tailrec fun maxDigitDown(n:Int, res:Int): Int{
            if (n==0) return res
            else
                return if (n%10 > res)
                    maxDigitDown(n/10, n%10)
                else maxDigitDown(n / 10, res)
        }
        return  maxDigitDown(abs(n), 0)
    }

    //Максимальная цифра в числе циклом
    fun maxDigit(n: Int): Int{
        var copy = abs(n)
        var curMax = 0
        while (copy!=0){
            curMax = max(curMax, copy%10)
            copy/=10
        }
        return curMax
    }

    //Минимальная нечётная цифра в числе рекурсией вверх
    fun minOddDigitUp(n: Int): Int{
        if (n == 0) return 10
        else
        {
            if (abs(n%10)%2==1)
                return min(minOddDigitUp(n/10), abs(n%10))
            else
                return minOddDigitUp(n / 10)
        }
    }

    //Минимальная нечётная цифра в числе рекурсией вниз
    fun minOddDigitDown(n: Int): Int{
        tailrec fun minOddDigitDown(n: Int, res:Int): Int{
            if (n==0) return res
            else
                return if (n%10 < res && n%10%2==1)
                    minOddDigitDown(n/10, n%10)
                else minOddDigitDown(n / 10, res)
        }
        return minOddDigitDown(abs(n),10)
    }

    //Минимальная нечётная цифра в числе рекурсией вниз
    fun minOddDigit(n: Int): Int{
        var copy = abs(n)
        var curMax = 10
        while (copy!=0){
            if (copy%10%2==1)
                curMax = min(curMax, copy%10)
            copy/=10
        }
        return curMax
    }

    fun nod(a: Int, b: Int): Int {
        var x = abs(a)
        var y = abs(b)
        while (y != 0) {
            val temp = y
            y = x % y
            x = temp
        }
        return x
    }

    tailrec fun nodDown(a: Int, b: Int): Int = if (b == 0) abs(a) else nodDown(b, a % b)

    fun main() {
        println("Hello World!")
        val scanner = Scanner(`in`)
        val x: Int = scanner.nextInt()
        println(sumcd(x))
    }
}

fun main() = Main().main()