<?php
include('../mysql/conexion.php');
include('../functions/common_functions.php');
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pagina de registro Valle Tech</title>
    <link rel="stylesheet" href="../assets/css/bootstrap.css" />
    <link rel="stylesheet" href="../assets/css/main.css" />
</head>

<body>

    <div class="register">
        <div class="container py-3">
            <h2 class="text-center mb-4">Registrar nuevo usuario</h2>
            <div class="row justify-content-center">
                <div class="col-lg-6">
                    <form action="" method="post" enctype="multipart/form-data" class="d-flex flex-column gap-4">
                        <!-- username field  -->
                        <div class="form-outline">
                            <label for="usuario_nombre" class="form-label">Nombre usuario</label>
                            <input type="text" placeholder="Ingresa un nombre de usuario" autocomplete="off" required="required" name="usuario_nombre" id="usuario_nombre" class="form-control">
                        </div>
                        <!-- email field  -->
                        <div class="form-outline">
                            <label for="correo_usuario" class="form-label">Correo electronico</label>
                            <input type="email" placeholder="Ingresa tu correo" autocomplete="off" required="required" name="correo_usuario" id="correo_usuario" class="form-control">
                        </div>
                        <!-- image field  -->
                        <div class="form-outline">
                            <label for="usuario_imagen" class="form-label">Imagen de perfil</label>
                            <input type="file" required="required" name="usuario_imagen" id="usuario_imagen" class="form-control">
                        </div>
                        <!-- password field  -->
                        <div class="form-outline">
                            <label for="usuario_pass" class="form-label">Contraseña</label>
                            <input type="password" placeholder="Ingresa una contraseña" autocomplete="off" required="required" name="usuario_pass" id="usuario_pass" class="form-control">
                        </div>
                        <!-- confirm password field  -->
                        <div class="form-outline">
                            <label for="conf_usuario_pass" class="form-label">Confirma la contraseña</label>
                            <input type="password" placeholder="Confirma la contraseña" autocomplete="off" required="required" name="conf_usuario_pass" id="conf_usuario_pass" class="form-control">
                        </div>
                        <!-- address field  -->
                        <div class="form-outline">
                            <label for="usuario_direccion" class="form-label">Direccion</label>
                            <input type="text" placeholder="Enter your address" autocomplete="off" required="required" name="usuario_direccion" id="usuario_direccion" class="form-control">
                        </div>
                        <!-- mobile field  -->
                        <div class="form-outline">
                            <label for="movil_usuario" class="form-label">Telefono</label>
                            <input type="text" placeholder="Ingresa tu telefono" autocomplete="off" required="required" name="movil_usuario" id="movil_usuario" class="form-control">
                        </div>
                        <div>
                            <input type="submit" value="Register" class="btn btn-primary mb-2" name="user_register">
                            <p>
                                Ya tienes cuenta? <a href="user_login.php" class="text-primary text-decoration-underline"><strong>Inicia sesion</strong></a>
                            </p>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script src="./assets//js/bootstrap.bundle.js"></script>
</body>

</html>
<!-- php code  -->
<?php
if (isset($_POST['user_register'])) {
    $user_username = $_POST['user_username'];
    $user_email = $_POST['user_email'];
    $user_password = $_POST['user_password'];
    $hash_password = password_hash($user_password,PASSWORD_DEFAULT);
    $conf_user_password = $_POST['conf_user_password'];
    $user_address = $_POST['user_address'];
    $user_mobile = $_POST['user_mobile'];
    $user_image = $_FILES['user_image']['name'];
    $user_image_tmp = $_FILES['user_image']['tmp_name'];
    $user_ip = getIPAddress();
    // check if user exist or not
    $select_query = "SELECT * FROM `user_table` WHERE username='$user_username' OR user_email='$user_email'";
    $select_result = mysqli_query($con, $select_query);
    $rows_count = mysqli_num_rows($select_result);
    if ($rows_count > 0) {
        echo "<script>window.alert('Username | Email already exist');</script>";
    } else if ($user_password != $conf_user_password) {
        echo "<script>window.alert('Passwords are not match');</script>";
    } else {
        // insert query
        move_uploaded_file($user_image_tmp, "./user_images/$user_image");
        $insert_query = "INSERT INTO `user_table` (username,user_email,user_password,user_image,user_ip,user_address,user_mobile) VALUES ('$user_username','$user_email','$hash_password','$user_image','$user_ip','$user_address','$user_mobile')";
        $insert_result = mysqli_query($con, $insert_query);
        if ($insert_result) {
            echo "<script>window.alert('User added successfully');</script>";
        } else {
            die(mysqli_error($con));
        }
    }
    // //select cart items check if items in cart go to checkout !| go to index.php
    // $select_cart_items = "SELECT * FROM `card_details` WHERE ip_address='$user_ip'";
    // $select_cart_items_result = mysqli_query($con,$select_cart_items);
    // $rows_count_cart_items = mysqli_num_rows($select_cart_items_result);
    // if($rows_count_cart_items > 0 ){
    //     $_SESSION['username'] = $user_username;
    //     echo "<script>window.alert('You have items in your cart');</script>";
    //     echo "<script>window.open('checkout.php','_self');</script>";
    // }else{
    //     echo "<script>window.open('../index.php','_self');</script>";
    // }
}
?>