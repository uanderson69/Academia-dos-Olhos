<?php

// Configurações do banco de dados
$servername = "localhost";  // Host do banco de dados (geralmente "localhost" se estiver rodando localmente)
$username = "root";  // Nome de usuário do MySQL
$password = "";   // Senha do MySQL
$database = "academia";    // Nome do banco de dados

// Conexão com o banco de dados
$conn = new mysqli($servername, $username, $password, $database);

// Verifique a conexão
if ($conn->connect_error) {
    die("Erro de conexão com o banco de dados: " . $conn->connect_error);
}

?>
