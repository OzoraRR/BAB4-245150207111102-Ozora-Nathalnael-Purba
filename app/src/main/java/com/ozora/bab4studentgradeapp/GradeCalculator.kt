package com.ozora.bab4studentgradeapp

fun getGrade(score: Int): String = when {
    score >= 80 -> "A"
    score >= 70 -> "B"
    score >= 60 -> "C"
    else -> "D"
}

fun getStatus(score: Int): String =
    if (score >= 60) "Lulus" else "Tidak Lulus"

fun formatStudent(student: Student): String {
    val displayName = student.name ?: "Guest"

    return "$displayName | ${student.score} | ${getGrade(student.score)} | ${getStatus(student.score)}"
}