<?php include 'database.php'; ?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>

<body>
    <div class="container mt-3">
        <div class="card">
            <div class="card-header">
                File Upload
            </div>
            <div class="card-body">
                <table class="table table-hovered">
                    <thead>
                        <tr>
                            <th><strong>Title</strong></th>
                            <th><strong>Comments</strong></th>
                            <th><strong>File Name</strong></th>
                            <th><strong>Action</strong></th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php 
                        $sql = "SELECT title, Coments, fileName FROM files";
                        $result = mysqli_query($conn, $sql);
                        if (mysqli_num_rows($result) > 0) {
                            while($row = mysqli_fetch_assoc($result)) {
                        ?>
                        <tr>
                            <td><?php echo $row["title"] ?></td>
                            <td><?php echo $row["Coments"] ?></td>
                            <td><?php echo $row["fileName"] ?></td>
                            <td>
                                <button class="btn btn-primary btn-sm" id="view" data-toggle="modal" data-target="#ViewModal" onclick="showimg('<?php echo $row['fileName'] ?>')">View</button>
                                <button class="btn btn-primary btn-sm" id="download">Download</button>
                            </td>
                        </tr>
                        <?php 
                            }
                        }
                        else{
                           echo 'No Data';
                        }
                        $conn->close();
                        ?>
                    </tbody>
                </table>
            </div>
            <div class="modal fade" id="ViewModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div id="imageBox"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
    $(document).ready(function () {
        window.showimg = function(src) {
            $("#imageBox").html('<img src="uploads/'+src+'" />');
        };
        // $('#download').click(function(e) {
        //     // e.preventDefault();  //stop the browser from following
        //     // window.location.href = 'uploads/file.doc';
        //     console.log($('#download').html());
        // });
    });
</script>

</html>