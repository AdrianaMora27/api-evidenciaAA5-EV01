<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Servicio Web de Autenticación - SENA</title>
    <style>
        :root {
            --primario: #ffc107;
            --morado: #9C27B0;
            --oscuro: #212121;
            --blanco: #ffffff;
            --rosa: #ff69b4;
        }
        body {
            font-family: Arial, Helvetica, sans-serif;
            background-color: var(--rosa);
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .login-card {
            background-color: var(--blanco);
            padding: 3rem;
            border-radius: 1rem;
            box-shadow: 0px 5px 15px rgba(0,0,0,0.2);
            width: 100%;
            max-width: 40rem;
        }
        h2 {
            text-align: center;
            color: var(--oscuro);
            margin-bottom: 2rem;
        }
        .form-group {
            margin-bottom: 1.5rem;
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
        }
        label {
            font-weight: bold;
            color: var(--oscuro);
        }
        input {
            padding: 1rem;
            border: 1px solid #ccc;
            border-radius: 0.5rem;
            font-size: 1.6rem;
        }
        button {
            width: 100%;
            background-color: var(--primario);
            color: var(--oscuro);
            border: none;
            padding: 1.2rem;
            font-size: 1.8rem;
            font-weight: bold;
            border-radius: 0.5rem;
            cursor: pointer;
            transition: background-color 0.3s;
            margin-top: 1rem;
        }
        button:hover {
            background-color: var(--morado);
            color: var(--blanco);
        }
        .credenciales-demo {
            margin-top: 2rem;
            background-color: #f9f9f9;
            padding: 1rem;
            border-radius: 0.5rem;
            font-size: 1.3rem;
            color: #555;
        }
    </style>
</head>
<body>

    <div class="login-card">
        <h2>Portal de Autenticación API</h2>
        
        <!-- El formulario apunta al servicio web AuthServlet mediante el método POST -->
        <form action="api/auth" method="POST">
            <div class="form-group">
                <label for="usuario">Usuario (Email):</label>
                <input type="text" id="usuario" name="usuario" required placeholder="Ej: admin@lucimakeup.com">
            </div>

            <div class="form-group">
                <label for="password">Contraseña:</label>
                <input type="password" id="password" name="password" required placeholder="Ej: 123456">
            </div>

            <button type="submit">Iniciar Sesión</button>
        </form>

        <div class="credenciales-demo">
            <strong>Credenciales de prueba válidas:</strong><br>
            • Usuario: <code>admin@lucimakeup.com</code><br>
            • Contraseña: <code>123456</code>
        </div>
    </div>

</body>
</html>