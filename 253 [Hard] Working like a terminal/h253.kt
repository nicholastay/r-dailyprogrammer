// [2016-02-13] Challenge #253 [Hard] Working like a terminal
// https://www.reddit.com/r/dailyprogrammer/comments/45k70o/20160213_challenge_253_hard_working_like_a/

class Terminal(length: Int = 10, width: Int = 10) {
    var override: Boolean = false // override mode
    var cursorX: Int = 0 // column
    var cursorY: Int = 0 // row
    var termArray = Array(length, {CharArray(width)}) // 10 rows 10 columns

    fun moveCursor(x: Int = cursorX, y: Int = cursorY) { // Move cursor in terminal if possible
        if (x <= 9 && x >= 0) cursorX = x
        if (y <= 9 && y >= 0) cursorY = y
    }

    fun moveIncrCursor(x: Int = 0, y: Int = 0) { // Adds
        moveCursor(cursorX+x, cursorY+y)
    }

    fun insertChar(c: Char, o: Boolean = false) { // Inserts char at current pos and goes next column (override can be set to true)
        termArray[cursorY][cursorX] = c
        if (!o) moveIncrCursor(x=1)
    }

    fun exec(input: String): String { // Run commands
        var i: Int = 0
        val sInput = input.replace("\n", "") // Strip newlines
        while (i < sInput.length) {
            if (sInput[i] == '^') {
                // Is a command
                when (sInput[i+1]) {
                    'c' -> termArray = Array(10, {CharArray(10)}) // Basically init it again
                    'h' -> moveCursor(0, 0) // Move to 0,0
                    'b' -> moveCursor(x=0) // Start of line
                    'd' -> moveIncrCursor(y=1) // Down a line
                    'u' -> moveIncrCursor(y=-1) // Up a line
                    'l' -> moveIncrCursor(x=-1) // Left
                    'r' -> moveIncrCursor(x=1) // Right
                    'e' ->
                        // erase to the right
                        for (i in cursorX..9) { // current pos to 9 (EOL)
                            termArray[cursorY][i] = '0' // null char
                        }
                    'i' -> override = false
                    'o' -> override = true
                    '^' -> insertChar('^') // just insert a ^ char
                    else ->
                        if (Character.isDigit(sInput[i+1]) && Character.isDigit(sInput[i+2])) {
                            // ^DD
                            moveCursor(sInput[i+2]- '0', sInput[i+1] - '0') // - '0' to negate the charcode to the actual num value
                            i++ // skip iteration for that digit as well
                        } else {
                            // invalid command, insert normally?
                            insertChar('^')
                            insertChar(sInput[i+1])
                        }
                }
                i++ // Skip an iteration for the command itself
            } else {
                insertChar(sInput[i], override)
            }
            i++
        }

        // Build return string
        var output: String = ""
        for (row in termArray) {
            if (row.isNotEmpty()) {
                for (col in row) {
                    output += if (col.toInt() != 0) col else " " // Null char check
                }
            }
            output += "\n"
        }

        return output
    }
}

fun main(args: Array<String>) {
    val term = Terminal()
    val output = term.exec("""^h^c^i
^04^^
^13/ \^d^b  /   \
^u^d^d^l^l^l^l^l^l^l^l^l
^r^r^l^l^d<^49>^l^l^d/^b \
^d^r^r^66/^b  \
^b^d   \ /
^d^l^lv^d^b===========^i^94O123456
789^94A=======^u^u^u^u^u^u^l^l\^o^b^r/""")
    println(output)
}

