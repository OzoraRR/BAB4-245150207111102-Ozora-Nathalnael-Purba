package com.ozora.bab4studentgradeapp

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material3.Text
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.style.TextAlign

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        val students = listOf(
            Student(name = "Andi", score = 90),
            Student(name = null, score = 74),
            Student(name = "Citra", score = 65),
            Student(name = "Dewi", score = 55)
        )

        val result = students.joinToString(separator = "\n") {
            formatStudent(it)
        }

        setContent {
            Box(
                modifier = Modifier.fillMaxSize(),
                contentAlignment = Alignment.Center
            ) {
                Text(
                    text = result,
                    textAlign = TextAlign.Center
                )
            }
        }
    }
}