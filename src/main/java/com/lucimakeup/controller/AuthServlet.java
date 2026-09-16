package com.lucimakeup.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet que implementa un servicio web (API endpoint) para el registro
 * e inicio de sesión de usuarios.
 * Evidencia: GA7-220501096-AA5-EV01
 */
@WebServlet(name = "AuthServlet", urlPatterns = {"/api/auth"})
public class AuthServlet extends HttpServlet {

    // Credenciales simuladas para validar el caso de estudio
    private static final String USUARIO_VALIDO = "admin@lucimakeup.com";
    private static final String PASSWORD_VALIDO = "123456";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Configurar la respuesta en formato JSON con codificación UTF-8
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        // Obtener los parámetros enviados por el cliente (usuario y contraseña)
        String usuario = request.getParameter("usuario");
        String password = request.getParameter("password");
        
        // Validar que los campos no estén vacíos
        if (usuario == null || password == null || usuario.trim().isEmpty() || password.trim().isEmpty()) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            out.print("{\n" +
                      "  \"estado\": \"error\",\n" +
                      "  \"codigo\": 400,\n" +
                      "  \"mensaje\": \"Error: Debe proporcionar un usuario y una contraseña.\"\n" +
                      "}");
            return;
        }
        
        // Validar credenciales de acceso
        if (USUARIO_VALIDO.equals(usuario.trim()) && PASSWORD_VALIDO.equals(password.trim())) {
            // Autenticación satisfactoria
            response.setStatus(HttpServletResponse.SC_OK);
            out.print("{\n" +
                      "  \"estado\": \"exito\",\n" +
                      "  \"codigo\": 200,\n" +
                      "  \"mensaje\": \"¡Autenticación satisfactoria! Bienvenido al sistema.\"\n" +
                      "}");
        } else {
            // Error en la autenticación
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            out.print("{\n" +
                      "  \"estado\": \"error\",\n" +
                      "  \"codigo\": 401,\n" +
                      "  \"mensaje\": \"Error en la autenticación: Credenciales incorrectas.\"\n" +
                      "}");
        }
        
        out.flush();
    }
}