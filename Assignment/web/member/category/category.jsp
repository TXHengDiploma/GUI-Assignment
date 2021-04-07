<jsp:include page="/member/header.jsp">
	<jsp:param name="pageTitle" value="Main Page"/>
</jsp:include>

<script>
  $(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip({placement: "right"});   
  });
  </script>

<div class="container">
<div class="jumbotron text-center">
  <h1 style="color: #4e73df">Category</h1>
</div>
    
    <div class="row">
      <div class="col-lg-4 col-sm-6 mb-4">
        <div class="card h-100">
          <!-- Left and right controls --> <a class="carousel-control-prev" href="#demo" data-slide="prev">
          <span class="carousel-control-prev-icon"></span>
        </a>
        
          <a href="#"><img class="card-img-top" src="/member/cate_pic/t015f2a5819ec6f31eb.jpg" alt=""></a>
          <a class="carousel-control-next" href="#demo" data-slide="next">
            <span class="carousel-control-next-icon"></span>
          </a>
          <div class="card-body">
            <h4 class="card-title text-center">
              <a href="#" data-toggle="tooltip" title="Click To View">Category Name</a>
            </h4>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 mb-4">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="/member/cate_pic/t015f2a5819ec6f31eb.jpg" alt=""></a>
          <div class="card-body">
            <h4 class="card-title text-center">
              <a href="#" data-toggle="tooltip" title="Click To View">Category Name</a>
            </h4>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 mb-4">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="/member/cate_pic/t015f2a5819ec6f31eb.jpg" alt=""></a>
          <div class="card-body">
            <h4 class="card-title text-center">
              <a href="#" data-toggle="tooltip" title="Click To View">Category Name</a>
            </h4>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 mb-4">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="/member/cate_pic/t015f2a5819ec6f31eb.jpg" alt=""></a>
          <div class="card-body">
            <h4 class="card-title text-center">
              <a href="#" data-toggle="tooltip" title="Click To View">Category Name</a>
            </h4>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 mb-4">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="/member/cate_pic/t015f2a5819ec6f31eb.jpg" alt=""></a>
          <div class="card-body">
            <h4 class="card-title text-center">
              <a href="#" data-toggle="tooltip" title="Click To View">Category Name</a>
            </h4>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 mb-4">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="/member/cate_pic/t015f2a5819ec6f31eb.jpg" alt=""></a>
          <div class="card-body">
            <h4 class="card-title text-center">
              <a href="#" data-toggle="tooltip" title="Click To View">Category Name</a>
            </h4>
          </div>
        </div>
      </div>
    </div>

    <ul class="pagination justify-content-center">
      <li class="page-item">
          <a class="page-link" href="#" aria-label="Previous"><button class="btn btn-outline-primary">Previous</button></a>
      </li>
      <li class="page-item">
        <a class="page-link" href="#"><button class="btn btn-primary">1</button></a>
      </li>
      <li class="page-item">
          <a class="page-link" href="#" aria-label="Next"><button class="btn btn-outline-primary"><span>Next</span></button></a>
      </li>
    </ul>
  
  </div>

  <jsp:include page="/member/footer.jsp"/>