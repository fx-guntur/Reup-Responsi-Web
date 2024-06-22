<?php

define('host', 'localhost');
define('user', 'root');
define('pass', '');
define('db', 'preorder_db');

$conn = mysqli_connect(host, user, pass, db);

$nama = "";
$email = "";
$phone = "";
$quantity = "";
$id_item = "";

if (isset($_GET['op'])) {
    $op = $_GET['op'];
} else {
    $op = "";
}

function registrasi($data) {
	global $conn;

	$username = strtolower(stripslashes($data["logname"]));
	$password = mysqli_real_escape_string($conn, $data["logpass"]);
	$password2 = mysqli_real_escape_string($conn, $data["logpass2"]);

	// cek username sudah ada atau belum
	$result = mysqli_query($conn, "SELECT username FROM user WHERE username = '$username'");

	if( mysqli_fetch_assoc($result) ) {
		echo "<script>
				alert('username sudah terdaftar!')
		      </script>";
		return false;
	}


	// cek konfirmasi password
	if( $password !== $password2 ) {
		echo "<script>
				alert('konfirmasi password tidak sesuai!');
		      </script>";
		return false;
	}

	// enkripsi password
	$password = password_hash($password, PASSWORD_DEFAULT);

	// tambahkan userbaru ke database
	mysqli_query($conn, "INSERT INTO user(username, password) VALUES('$username', '$password')");

	return mysqli_affected_rows($conn);

}

if( isset($_POST["login"]) ) {

	$username = $_POST["logname"];
	$password = $_POST["logpass"];

	$result = mysqli_query($conn, "SELECT * FROM user WHERE username = '$username'");

	// cek username
	if( mysqli_num_rows($result) === 1 ) {

		// cek password
		$row = mysqli_fetch_assoc($result);
		if( password_verify($password, $row["password"]) ) {
			// set session
			$_SESSION["login"] = true;
            $_SESSION["id"] = $row["id_user"];
        
			header("Location: home.php");
			exit;
		}
	}

	$error = true;

}

if ($op == 'delete') {
    $id_beli = $_GET['id'];
    $sql1 = "DELETE FROM preorder_form where id = '$id_beli'";
    $q1 = mysqli_query($conn, $sql1);
    if ($q1) {
        $sukses = "Berhasil hapus data";
    } else {
        $error = "Gagal melakukan delete data";
    }
}

if ($op == 'edit') {
    $id_beli = $_GET['id'];
    $sql1 = "SELECT * FROM preorder_form where id = '$id_beli'";
    $q1 = mysqli_query($conn, $sql1);
    $r1 = mysqli_fetch_array($q1);
    $nama = $r1['nama'];
    $email = $r1['email'];
    $phone = $r1['phone'];
    $quantity = $r1['jumlah'];
    $id_item = $r1['item'];
    // $sql2 = "SELECT * FROM merch_item where id_item = '$id_item'";
    // $q2 = mysqli_query($conn, $sql2);
    // $r2 = mysqli_fetch_array($q2);
    // $item_selected = $r2['nama_item'];
}


if (isset($_POST['send'])) {
    $nama = mysqli_real_escape_string($conn, $_POST['nama']);
    $email = mysqli_real_escape_string($conn, $_POST['email']);
    $hp = mysqli_real_escape_string($conn, $_POST['phone']);
    $id_item = mysqli_real_escape_string($conn, $_POST['choosedItem']);
    $jumlah = mysqli_real_escape_string($conn, $_POST['quantity']);
    $id_user = mysqli_real_escape_string($conn, $_SESSION['id']);

    if ($nama && $email && $hp && $id_item && $jumlah) {
        if ($op == 'edit') {
            $sql1 = "UPDATE preorder_form SET nama = '$nama', email = '$email', phone = '$phone',  item = '$id_item', jumlah = '$jumlah' WHERE id = '$id_beli'";
            $q1 = mysqli_query($conn, $sql1);
            if ($q1) {
                $sukses = "Data berhasil di Update";
            } else {
                $error = "Data gagal diupdate";
            }
        } else{
        $sqli = "INSERT INTO preorder_form(nama, email, phone, item, jumlah, id_user) VALUES('$nama','$email','$hp', '$id_item', '$jumlah', '$id_user')";
        $q1 = mysqli_query($conn, $sqli);
        if ($q1) {
            ?>
            <script>
                alert('Pre-order Success!');
            </script>
            <?php
        } else {
            ?>
            <script>
                alert('Pre-order failed!');
            </script>
            <?php
        }
    }
 } else {
        ?>
        <script>
            alert('Please input all the data!');
        </script>
        <?php
    }
}
?>