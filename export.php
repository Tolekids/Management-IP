<?php
// panggil file "database.php" untuk koneksi ke database
require_once "config/database.php";
// panggil file "fungsi_tanggal_indo.php" untuk membuat format tanggal indonesia
require_once "helper/fungsi_tanggal_indo.php";

// fungsi header untuk mengirimkan raw data excel
header("Content-type: application/vnd-ms-excel");
// mendefinisikan nama file hasil ekspor "Data-Member.xls"
header("Content-Disposition: attachment; filename=Data-Member.xls");
?>
<!-- halaman HTML yang akan diexport ke excel -->
<!-- judul tabel -->
<center>
  <h2>DATA IP</h2>
</center>
<!-- tabel untuk menampilkan data dari database -->
<table border="1">
  <thead>
    <tr style="background-color:#31316a;color:#fff">
      <th height="30" align="center" vertical="center">No.</th>
      <th height="30" align="center" vertical="center">ID User</th>
      <th height="30" align="center" vertical="center">Tanggal Upload</th>
      <th height="30" align="center" vertical="center">Jenis Pilot</th>
      <th height="30" align="center" vertical="center">IP</th>
      <th height="30" align="center" vertical="center">Perangkat</th>
      <th height="30" align="center" vertical="center">Keterangan</th>
      <th height="30" align="center" vertical="center">Domain</th>
      <th height="30" align="center" vertical="center">Nama Perangkat</th>
    </tr>
  </thead>
  <tbody>
    <?php
    // variabel untuk nomor urut tabel 
    $no = 1;
    // sql statement untuk menampilkan data dari tabel "tbl_member"
    $query = mysqli_query($mysqli, "SELECT * FROM tbl_member ORDER BY id_member ASC")
                                    or die('Ada kesalahan pada query tampil data : ' . mysqli_error($mysqli));
    // ambil data hasil query
    while ($data = mysqli_fetch_assoc($query)) { ?>
      <!-- tampilkan data -->
      <tr>
        <td width="50" align="center"><?= $no++; ?></td>
        <td width="100" align="center"><?= $data['id_member']; ?></td>
        <td width="130" align="center"><?= date('d-m-Y', strtotime($data['tanggal_upload'])); ?></td>
        <td width="130" align="center"><?= $data['jenis_pilot']; ?></td>
        <td width="200"><?= $data['ip']; ?></td>
        <td width="120" align="center"><?= $data['perangkat']; ?></td>
        <td width="250"><?= $data['keterangan']; ?></td>
        <td width="240"><?= $data['domain']; ?></td>
        <td width="120" align="center">'<?= $data['nama_perangkat']; ?></td>
      </tr>
    <?php } ?>
  </tbody>
</table>
<br><br>
<div style="text-align: right">Bondowoso <?= tanggal_indo(date('Y-m-d')); ?></div>