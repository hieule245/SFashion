/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


$(document).ready(function(){
    fetch('./home',{
        method: 'GET',
        headers: {
            'content-type': 'application/json'
        }
    }).then(response =>{
        if (!response.ok){
            throw new Error('Network was not ok! Status: '+response.status);
        }else return response.text();
    });
});