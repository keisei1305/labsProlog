import org.junit.jupiter.api.Test
import org.junit.jupiter.api.Assertions.*

internal class MainKtTest {

    @Test
    fun max3() {
        val main = Main()
        val expected = 10
        assertEquals(expected, main.max3(3,10,5))
    }

    @Test
    fun factup() {
        val main = Main()
        val expected = 120
        assertEquals(expected, main.factup(5))
    }

    @Test
    fun factdown() {
        val main = Main()
        val expected = 720
        assertEquals(expected, main.factdown(6))
    }

    @Test
    fun calc() {
        val main = Main()
        val expected = 10
        assertEquals(expected, main.calc(true)(1234))
    }

    @Test
    fun sumd() {
        val main = Main()
        val expected = 15
        assertEquals(expected, main.sumd(12345))
    }

    @Test
    fun muld() {
        val main = Main()
        val expected = 126
        assertEquals(expected, main.muld(367))
    }

    @Test
    fun maxd() {
        val main = Main()
        val expected = 7
        assertEquals(expected, main.maxd(123745))
    }

    @Test
    fun mind() {
        val main = Main()
        val expected = 2
        assertEquals(expected, main.mind(923745))
    }

    @Test
    fun maxDigitTest(){
        val main = Main()
        assertEquals(8, main.maxDigit(12321857))
        assertEquals(8, main.maxDigitUp(12321857))
        assertEquals(8, main.maxDigitDown(12321857))
        assertEquals(0, main.maxDigit(0))
        assertEquals(0, main.maxDigitUp(0))
        assertEquals(0, main.maxDigitDown(0))
        assertEquals(2, main.maxDigit(-21))
        assertEquals(2, main.maxDigitUp(-21))
        assertEquals(2, main.maxDigitDown(-21))
    }

    @Test
    fun minDigitTest(){
        val main = Main()
        assertEquals(3, main.minOddDigit(6582387))
        assertEquals(3, main.minOddDigitUp(6582387))
        assertEquals(3, main.minOddDigitDown(6582387))
        assertEquals(10, main.minOddDigit(0))
        assertEquals(10, main.minOddDigitUp(0))
        assertEquals(10, main.minOddDigitDown(0))
        assertEquals(1, main.minOddDigit(-21))
        assertEquals(1, main.minOddDigitUp(-21))
        assertEquals(1, main.minOddDigitDown(-21))
    }
}