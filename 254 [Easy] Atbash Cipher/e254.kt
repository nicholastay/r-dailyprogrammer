// [2016-02-16] Challenge #254 [Easy] Atbash Cipher
// https://www.reddit.com/r/dailyprogrammer/comments/45w6ad/20160216_challenge_254_easy_atbash_cipher/

fun atbash(input: String): String {
    var reversed: String = ""
    for (i in 0..input.length-1) {
        val code = input.codePointAt(i)
        when {
            code >= 65 && code <= 90 -> reversed += Character.toString((91-(code-64)).toChar()) // Upper
            code >= 97 && code <= 122 -> reversed += Character.toString((123-(code-96)).toChar()) // Lower
            else -> reversed += Character.toString(input.get(i)) // Other catchall
        }
    }
    return reversed
}

fun main(args: Array<String>) {
    println(atbash("/r/dailyprogrammer"))
}