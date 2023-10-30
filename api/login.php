<?php
require 'config.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents("php://input"));

    $email = $data->email;
    $senha = $data->senha;

    $query = "SELECT * FROM usuarios WHERE email = '$email' AND senha = '$senha'";

    $result = $conn->query($query);

    if ($result->num_rows > 0) {
        $response = array('success' => true, 'message' => 'Login bem-sucedido');
    } else {
        $response = array('success' => false, 'message' => 'Credenciais incorretas');
    }

    echo json_encode($response);
}

$conn->close();
?>
