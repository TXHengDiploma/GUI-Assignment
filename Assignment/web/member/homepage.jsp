<jsp:include page="/member/header.jsp">
	<jsp:param name="pageTitle" value="Main Page"/>
</jsp:include>

<script>
        $(document).ready(function(){
          $('[data-toggle="tooltip"]').tooltip({placement: "right"});   
        });


</script>

<div id="carouselExampleControls" class="carousel slide mb-25" data-ride="carousel" data-interval="1500">
    <div class="carousel-inner w-70 ">
        <div class="carousel-item active">
            <a href="1"><img src="/member/cate_pic/images.jpg" alt="First slide" class="img-responsive rounded w-100">
        </div></a>

        <div class="carousel-item">
            <a href="2"><img src="/member/cate_pic/images.jpg" alt="Second slide" class="img-responsive rounded w-100">
        </div></a>

        <div class="carousel-item">
            <a href="3"><img src="/member/cate_pic/images.jpg" alt="Third slide" class="img-responsive rounded w-100">
        </div></a>
    </div>
        <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
</div>
<hr class="my-4">
<div class="show_product">
    <div class="row">
    <div class="col-lg-4 col-sm-6 mb-4">
        <div class="card h-100">
        <!-- Left and right controls --> 
        <a class="carousel-control-prev" href="#demo" data-slide="prev">
            <span class="carousel-control-prev-icon"></span>
        </a>
        <a href="#"><img class="card-img-top" src="/member/cate_pic/t015f2a5819ec6f31eb.jpg" alt=""></a>
        <a class="carousel-control-next" href="#demo" data-slide="next">
            <span class="carousel-control-next-icon"></span>
        </a>

        <div class="card-body">
            <h4 class="card-title text-center">
                <a href="#" data-toggle="tooltip" title="Click To View">Product</a>
            </h4>
            <p>Product Description</p>
        </div>
        </div>
    </div>

    <div class="col-lg-4 col-sm-6 mb-4">
        <div class="card h-100">
        <a href="#"><img class="card-img-top" src="/member/cate_pic/t015f2a5819ec6f31eb.jpg" alt=""></a>
            <div class="card-body">
            <h4 class="card-title text-center">
            <a href="#" data-toggle="tooltip" title="Click To View">Product</a>
            </h4>
            <p>Product Description</p>
            </div>
        </div>
    </div>

    <div class="col-lg-4 col-sm-6 mb-4">
        <div class="card h-100">
        <a href="#"><img class="card-img-top" src="/member/cate_pic/t015f2a5819ec6f31eb.jpg" alt=""></a>
        <div class="card-body">
            <h4 class="card-title text-center">
            <a href="#" data-toggle="tooltip" title="Click To View">Product</a>
            </h4>
            <p>Product Description</p>
        </div>
        </div>
    </div>
    <div class="col-lg-4 col-sm-6 mb-4">
        <div class="card h-100">
        <a href="#"><img class="card-img-top" src="/member/cate_pic/t015f2a5819ec6f31eb.jpg" alt=""></a>
        <div class="card-body">
            <h4 class="card-title text-center">
            <a href="#" data-toggle="tooltip" title="Click To View">Product</a>
            </h4>
            <p>Product Description</p>
        </div>
        </div>
    </div>
    <div class="col-lg-4 col-sm-6 mb-4">
        <div class="card h-100">
        <a href="#"><img class="card-img-top" src="/member/cate_pic/t015f2a5819ec6f31eb.jpg" alt=""></a>
        <div class="card-body">
            <h4 class="card-title text-center">
            <a href="#" data-toggle="tooltip" title="Click To View">Product</a>
            </h4>
            <p>Product Description</p>
        </div>
        </div>
    </div>
    <div class="col-lg-4 col-sm-6 mb-4">
        <div class="card h-100">
        <a href="#"><img class="card-img-top" src="/member/cate_pic/t015f2a5819ec6f31eb.jpg" alt=""></a>
        <div class="card-body">
            <h4 class="card-title text-center">
            <a href="#" data-toggle="tooltip" title="Click To View">Product</a>  
            </h4>
            <p>Product Description</p>
        </div>
        </div>
    </div>
    </div>
</div>    

<jsp:include page="/member/footer.jsp"/>