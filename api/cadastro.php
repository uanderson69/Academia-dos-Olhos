<?php
require 'config.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents("php://input"));

    $nome = $data->nome;
    $email = $data->email;
    $senha = $data->senha; // Senha em texto plano
    $usa_oculos = $data->usa_oculos;
    $grau_oculos = $data->grau_oculos;

    $query = "INSERT INTO usuarios (nome, email, senha, usa_oculos, grau_oculos) VALUES ('$nome', '$email', '$senha', '$usa_oculos', '$grau_oculos')";

    if ($conn->query($query) === TRUE) {
        $response = array('success' => true, 'message' => 'Cadastro bem-sucedido');
    } else {
        $response = array('success' => false, 'message' => 'Erro no cadastro: ' . $conn->error);
    }

    echo json_encode($response);
}

$conn->close();
?>
