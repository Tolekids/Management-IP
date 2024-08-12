<?php
// panggil file "database.php" untuk koneksi ke database
require_once "config/database.php";
include 'helper.php';

// Call the checkSessionLogin function
checkSessionLogin();

// mengecek data hasil submit dari form
if (isset($_POST['simpan'])) {
  // ambil data hasil submit dari form
  $id_member          = mysqli_real_escape_string($mysqli, $_POST['id_member']);
  $tanggal            = mysqli_real_escape_string($mysqli, trim($_POST['tanggal_upload']));
  $jenis_pilot       = mysqli_real_escape_string($mysqli, $_SESSION['username']);
  $ip       = mysqli_real_escape_string($mysqli, trim($_POST['ip']));
  $perangkat      = mysqli_real_escape_string($mysqli, $_POST['perangkat']);
  $keterangan             = mysqli_real_escape_string($mysqli, trim($_POST['keterangan']));
  $domain              = mysqli_real_escape_string($mysqli, trim($_POST['domain']));
  $whatsapp           = mysqli_real_escape_string($mysqli, trim($_POST['nama_perangkat']));

  // ubah format tanggal menjadi Tahun-Bulan-Hari (Y-m-d) sebelum disimpan ke database
  $tanggal_upload     = date('Y-m-d', strtotime($tanggal));

  // ambil data file hasil submit dari form
  $nama_file          = $_FILES['foto']['name'];
  $tmp_file           = $_FILES['foto']['tmp_name'];
  $extension          = array_pop(explode(".", $nama_file));
  // enkripsi nama file
  $nama_file_enkripsi = sha1(md5(time() . $nama_file)) . '.' . $extension;
  // tentukan direktori penyimpanan file
  $path               = "images/" . $nama_file_enkripsi;

  // lakukan proses unggah file
  // jika file berhasil diunggah
  if (move_uploaded_file($tmp_file, $path)) {
    // sql statement untuk insert data ke tabel "tbl_member"
    $insert = mysqli_query($mysqli, "INSERT INTO tbl_member(id_member, tanggal_upload, jenis_pilot, ip, perangkat, keterangan, domain, nama_perangkat, foto_profil)
                                    VALUES('$id_member', '$tanggal_upload', '$jenis_pilot', '$ip', '$perangkat', '$keterangan', '$domain', '$nama_perangka', '$nama_file_enkripsi')")
                                    or die('Ada kesalahan pada query insert : ' . mysqli_error($mysqli));
    // cek query
    // jika proses insert berhasil
    if ($insert) {
      // alihkan ke halaman data member dan tampilkan pesan berhasil simpan data
      header('location: dashboard.php?halaman=data&pesan=1');
    }
  }
}
