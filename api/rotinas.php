<?php
// Configurações do banco de dados
$servername = "localhost";
$username = "root";
$password = "";
$database = "academia";

// Conexão com o banco de dados
$conn = new mysqli($servername, $username, $password, $database);

// Verifique a conexão
if ($conn->connect_error) {
    die("Erro de conexão com o banco de dados: " . $conn->connect_error);
}

// Obtenha os horários do Flutter
$hourDay = $_POST['hourDay'];
$hourNight = $_POST['hourNight'];

// Insira os horários na tabela
$sql = "INSERT INTO rotina (hora_do_dia, hora_da_noite) VALUES ('$hourDay', '$hourNight')";

if ($conn->query($sql) === TRUE) {
    $response = array('success' => true, 'message' => 'Horários salvos com sucesso');
} else {
    $response = array('success' => false, 'message' => 'Erro ao salvar os horários: ' . $conn->error);
}

echo json_encode($response);

$conn->close();
?>
