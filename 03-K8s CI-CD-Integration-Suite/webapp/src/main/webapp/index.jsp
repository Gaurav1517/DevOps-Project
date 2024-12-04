<!-- <Html>  
<head>   
<title>  
Registration Page  
</title>  
</head>  
<body bgcolor="White">  
<br>  
<br>  
<form>  
  
<label> First-ame </label>         
<input type="text" name="firstname" size="15"/> <br> <br>  
<label> Middlename: </label>     
<input type="text" name="middlename" size="15"/> <br> <br>  
<label> Lastname: </label>         
<input type="text" name="lastname" size="15"/> <br> <br>  
  
<label>   
Course :  
</label>   
<select>  
<option value="Course">Course</option>  
<option value="BCA">BCA</option>  
<option value="BBA">BBA</option>  
<option value="B.Tech">B.Tech</option>  
<option value="MBA">MBA</option>  
<option value="MCA">MCA</option>  
<option value="M.Tech">M.Tech</option>  
</select>  
  
<br>  
<br>  
<label>   
Gender :  
</label><br>  
<input type="radio" name="male"/> Male <br>  
<input type="radio" name="female"/> Female <br>  
<input type="radio" name="other"/> Other  
<br>  
<br>  
  
<label>   
Phone :  
</label>  
<input type="text" name="country code"  value="+91" size="2"/>   
<input type="text" name="phone" size="10"/> <br> <br>  
Address  
<br>  
<textarea cols="80" rows="5" value="address">  
</textarea>  
<br> <br>  
Email:  
<input type="email" id="email" name="email"/> <br>    
<br> <br>  
Password:  
<input type="Password" id="pass" name="pass"> <br>   
<br> <br>  
Re-type password:  
<input type="Password" id="repass" name="repass"> <br> <br>  
<input type="button" value="Submit"/>  
</form>  
</body>  
</html>   -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Demo: Build and Deploy Application</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(to bottom right, #1f4037, #99f2c8);
            color: #fff;
            overflow-x: hidden;
        }

        header {
            text-align: center;
            padding: 2rem;
            background: #282828;
        }

        header h1 {
            font-size: 2.5rem;
            margin: 0;
            animation: fadeIn 2s;
        }

        header p {
            margin: 0.5rem 0 0;
            font-size: 1.2rem;
            animation: fadeIn 2s 1s;
        }

        .container {
            padding: 2rem;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 1.5rem;
        }

        .tool {
            background: rgba(0, 0, 0, 0.8);
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5);
            overflow: hidden;
            width: 300px;
            text-align: center;
            transform: translateY(50px);
            animation: slideIn 1s forwards;
        }

        .tool img {
            width: 100%;
            height: auto;
            transition: transform 0.3s;
        }

        .tool:hover img {
            transform: scale(1.1);
        }

        .tool h3 {
            margin: 1rem 0;
            font-size: 1.5rem;
        }

        .tool p {
            margin: 0 1rem 1rem;
            font-size: 1rem;
        }

        footer {
            text-align: center;
            padding: 1rem;
            background: #282828;
            color: #aaa;
            font-size: 0.9rem;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes slideIn {
            from { transform: translateY(50px); }
            to { transform: translateY(0); }
        }

        @media (max-width: 768px) {
            .tool {
                width: 90%;
            }
        }
    </style>
</head>
<body>
    <header>
        <h1>We Can Build and Deploy Applications</h1>
        <p>Using tools like Jenkins, Git, GitHub, Ansible, Docker, Maven, and Java</p>
    </header>

    <div class="container">
        <div class="tool">
            <img src="https://cdn.iconscout.com/icon/free/png-512/jenkins-3521453-2945012.png" alt="Jenkins">
            <h3>Jenkins</h3>
            <p>Automate your CI/CD pipelines with ease using Jenkins.</p>
        </div>

        <div class="tool">
            <img src="https://git-scm.com/images/logos/downloads/Git-Icon-1788C.png" alt="Git">
            <h3>Git</h3>
            <p>Version control for tracking changes in your projects.</p>
        </div>

        <div class="tool">
            <img src="https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png" alt="GitHub">
            <h3>GitHub</h3>
            <p>Host and manage your code repositories.</p>
        </div>

        <div class="tool">
            <img src="https://cdn.iconscout.com/icon/free/png-512/ansible-2752068-2284904.png" alt="Ansible">
            <h3>Ansible</h3>
            <p>Automate application deployment with powerful playbooks.</p>
        </div>

        <div class="tool">
            <img src="https://www.docker.com/wp-content/uploads/2022/03/vertical-logo-monochromatic.png" alt="Docker">
            <h3>Docker</h3>
            <p>Run your applications in isolated and scalable containers.</p>
        </div>

        <div class="tool">
            <img src="https://cdn.iconscout.com/icon/free/png-512/maven-282184.png" alt="Maven">
            <h3>Maven</h3>
            <p>Dependency management and build automation made easy.</p>
        </div>

        <div class="tool">
            <img src="https://cdn.iconscout.com/icon/free/png-512/java-60-1174953.png" alt="Java">
            <h3>Java</h3>
            <p>Powerful language for building robust applications.</p>
        </div>
    </div>

    <footer>
        <p>&copy; 2024 Demo Project - Build and Deploy Applications</p>
    </footer>
</body>
</html>