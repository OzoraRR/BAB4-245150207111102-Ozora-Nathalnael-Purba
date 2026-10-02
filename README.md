# BAB4-245150207111102-Ozora-Nathalnael-Purba

## Student Grade App

Aplikasi Android sederhana untuk mengolah dan menampilkan data nilai mahasiswa. Aplikasi menggunakan Kotlin untuk business logic dan Jetpack Compose untuk menampilkan hasilnya.

## Fitur

- Menyimpan data mahasiswa dengan `data class Student`.
- Mendukung nama mahasiswa yang bernilai `null`; nama tersebut ditampilkan sebagai `Guest`.
- Menentukan grade berdasarkan nilai:
  - Nilai minimal 80: A
  - Nilai minimal 70: B
  - Nilai minimal 60: C
  - Nilai di bawah 60: D
- Menentukan status kelulusan. Nilai minimal 60 dinyatakan `Lulus`.
- Menampilkan hasil beberapa mahasiswa di tengah layar.

## Contoh Data dan Hasil

| Nama | Nilai | Grade | Status |
|---|---:|:---:|---|
| Andi | 90 | A | Lulus |
| Guest | 74 | B | Lulus |
| Citra | 65 | C | Lulus |
| Dewi | 55 | D | Tidak Lulus |

Nama `Guest` berasal dari data mahasiswa yang nama aslinya bernilai `null`.

## Alur Aplikasi

1. `MainActivity` membuat daftar data mahasiswa.
2. Setiap mahasiswa diproses oleh function `formatStudent()`.
3. Hasil setiap mahasiswa digabungkan menjadi satu teks dengan pemisah baris baru.
4. `setContent` menampilkan teks tersebut menggunakan `Text`.
5. `Box` menempatkan teks di tengah layar.

## Struktur Kode

- `Student.kt` — model data mahasiswa.
- `GradeCalculator.kt` — function `getGrade()`, `getStatus()`, dan `formatStudent()`.
- `MainActivity.kt` — menyiapkan daftar mahasiswa dan menampilkan hasil dengan Jetpack Compose.

## Hasil Tampilan

```text
Andi | 90 | A | Lulus
Guest | 74 | B | Lulus
Citra | 65 | C | Lulus
Dewi | 55 | D | Tidak Lulus
