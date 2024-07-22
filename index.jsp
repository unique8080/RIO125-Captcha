<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>CAPTCHA Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .center-box {
            width: 350px;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .center-box h2 {
            margin-bottom: 20px;
            color: #333;
        }
        .center-box label {
            display: block;
            margin-bottom: 5px;
            color: #666;
        }
        .center-box input {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .center-box button {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: none;
            border-radius: 5px;
            background-color: #007bff;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
        }
        .center-box button:hover {
            background-color: #0056b3;
        }
        .captcha-img {
            display: block;
            margin: 10px auto;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .refresh-btn {
            background-color: #28a745;
        }
        .refresh-btn:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <div class="center-box">
        <h2>Secure Form</h2>
        <form action="validate" method="post">
            <label for="Name">Name:</label>
            <input type="text" id="Name" name="Name" required>
            
            <label for="Email">Email:</label>
            <input type="email" id="Email" name="Email" required>
            
            <label for="Password">Password:</label>
            <input type="password" id="Password" name="Password" required>
            
            <label for="Number">Number:</label>
            <input type="text" id="Number" name="Number" required>
            
            <label for="captcha">Enter CAPTCHA:</label>
            <img src="captcha" alt="CAPTCHA Image" class="captcha-img" id="captchaImage"/>
            <button type="button" class="refresh-btn" onclick="refreshCaptcha()">Refresh CAPTCHA</button>
            <input type="text" id="captcha" name="captcha" required>
            
            <button type="submit">Submit</button>
        </form>
    </div>

    <script>
        function refreshCaptcha() {
            const captchaImg = document.getElementById('captchaImage');
            captchaImg.src = 'captcha?' + new Date().getTime();
        }
    </script>
</body>
</html>
