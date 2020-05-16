/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.infox.dal;

import java.sql.*;

/**
 *
 * @author Dyogo
 */
// shift + alt + f -> identacao
public class ModuloConexao {

    //Metodo responsavel por estabelecer a conexao com o banco de dados
    public static Connection conector() { // Connection [e um conjunto de funcionalidades que vem do pacote java.sql
        java.sql.Connection conexao = null;

        //chamamos o drive que foi importado na biblioteca
        String driver = "com.mysql.jdbc.Driver";

        //Armazenar informacoes referentes ao banco de dados
        String url = "jdbc:mysql://localhost:3306/dbinfox";
        String user = "root";
        String password = "";
        
        //Estabelecendo a conexao com o banco de dados
        try {
            Class.forName(driver); // executa arquivo do driver
            conexao = DriverManager.getConnection(url, user, password); // Obtem a conexao com os parametros
            return conexao;
        } catch (Exception e) {
            //Serve de apoio para esclarecer sobre possiveis erros
            //System.out.println(e);
            return null;
        }

    }
}
