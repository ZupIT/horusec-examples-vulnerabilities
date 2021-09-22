/*
 * Copyright 2021 ZUP IT SERVICOS EM TECNOLOGIA E INOVACAO SA
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package hello

abstract class EqualsPasswordField {

    fun hardcodedLogin1(username: String, password: String): Boolean {

        if (username == "admin") {
            println("OK")
        }
        if (username == "abc") {
            println("OK")
        }

        if (password == "@dm1n") { //!!
            return true
        }

        return validateDb(username, password)
    }

    fun hardcodedLogin2(username: String, password: String): Boolean {

        return if ("adm1nL3ft" == password) { //!!
            true
        } else validateDb(username, password)

    }

    fun hardcodedLogin3(username: String, p1: String): Boolean {

        val password = p1
        return if ("adm1nL3ft!!!!" == password) { //!! (Not supported at the moment)
            true
        } else validateDb(username, password)

    }

    fun safeLogin1(username: String, password: String): Boolean {

        return if (password == "") {
            true
        } else validateDb(username, password)

    }

    fun safeLogin2(username: String, password: String): Boolean {

        return if ("" == password) {
            false
        } else validateDb(username, password)

    }

    fun safeLogin3(username: String, password: String): Boolean {

        return if (getPassword(username) == password) {
            false
        } else validateDb(username, password)

    }

    fun safeLogin4(username: String, password: String): Boolean {

        return if (password == getPassword(username)) {
            false
        } else validateDb(username, password)

    }

    abstract fun validateDb(username: String, password: String): Boolean
    abstract fun getPassword(username: String): String
}

fun hardcodedLogin1(username: String, password: String): Boolean {

    if (username == "admin") {
        println("OK")
    }
    if (username == "abc") {
        println("OK")
    }

    if (password == "@dm1n") { //!!
        return true
    }

    return validateDb(username, password)
}

fun hardcodedLogin2(username: String, password: String): Boolean {

    return if ("adm1nL3ft" == password) { //!!
        true
    } else validateDb(username, password)

}

fun hardcodedLogin3(username: String, p1: String): Boolean {

    val password = p1
    return if ("adm1nL3ft!!!!" == password) { //!! (Not supported at the moment)
        true
    } else validateDb(username, password)

}

fun safeLogin1(username: String, password: String): Boolean {

    return if (password == "") {
        true
    } else validateDb(username, password)

}

fun safeLogin2(username: String, password: String): Boolean {

    return if ("" == password) {
        false
    } else validateDb(username, password)

}

fun safeLogin3(username: String, password: String): Boolean {

    return if (getPassword(username) == password) {
        false
    } else validateDb(username, password)

}

fun safeLogin4(username: String, password: String): Boolean {

    return if (password == getPassword(username)) {
        false
    } else validateDb(username, password)

}

fun validateDb(username: String, password: String): Boolean {
    return false
}

fun getPassword(username: String): String {
    throw IllegalStateException("Not implemented")
}

fun main(args : Array<String>) {
    val password = "secret1234"

    println(password)
}

