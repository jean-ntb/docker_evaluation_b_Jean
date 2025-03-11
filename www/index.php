<?php
// Récupérer les variables d'environnement
$env = getenv('ENVIRONMENT');
$debug = getenv('DEBUG');
$log_file = getenv('LOG_FILE');

ini_set('display_errors', $debug === 'true' ? 1 : 0);
ini_set('log_errors', 1);
ini_set('error_log', $log_file);

if ($env === 'dev') {
    echo "<h2>🔧 Environnement de développement</h2>";
}

$host = getenv('DB_HOST');
$dbname = getenv('DB_NAME');
$user = getenv('DB_USER');
$password = getenv('DB_PASSWORD');

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $user, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    echo "<h3>Connexion réussie à la base de données : $dbname</h3>";

    $stmt = $pdo->query("SELECT * FROM article");
    echo "<table border='1'><tr><th>ID</th><th>Title</th><th>Body</th></tr>";
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        echo "<tr><td>{$row['id']}</td><td>{$row['title']}</td><td>{$row['body']}</td></tr>";
    }
    echo "</table>";
} catch (PDOException $e) {
    echo "<h3> Erreur de connexion : " . $e->getMessage() . "</h3>";
}
?>
