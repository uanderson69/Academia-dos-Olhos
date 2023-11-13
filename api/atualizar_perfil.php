<?php
require 'config.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents("php://input"));

    $userId = $data->id;
    $nome = $data->nome;
    $email = $data->email;
    $senha = $data->senha; // Senha em texto plano
    // Adicione outros campos de perfil conforme necessário

    $query = "UPDATE usuarios SET nome = '$nome', email = '$email', senha = '$senha' WHERE id = $userId"; // Atualize a consulta SQL conforme necessário

    if ($conn->query($query) === TRUE) {
        $response = array('success' => true, 'message' => 'Perfil atualizado com sucesso');
    } else {
        $response = array('success' => false, 'message' => 'Erro na atualização do perfil: ' . $conn->error);
    }

    echo json_encode($response);
}

$conn->close();
?>
