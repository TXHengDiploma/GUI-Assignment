<div class="modal-dialog" role="document">
	<div class="modal-content">
		<div class="modal-header">
			<h5 class="modal-title">Fill up your address information</h5>
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<form action="/member/addresses/add" method="post">
            <div class="modal-body">
          
              <div class="form-group">
                <label for="inputReceiverName">Receiver Name</label>
                <input type="text" name="receiverName" class="form-control" id="inputReceiverName" placeholder="Name" required>
              </div>
          
              <div class="form-group">
                <label for="inputRemarkName">Remark Name</label>
                <input type="text" name="remarkName" class="form-control" id="inputRemarkName" placeholder="Company" required>
              </div>
          
              <div class="form-group">
                <label for="inputEmail">Email</label>
                <input type="text" name="email" class="form-control" id="inputEmail" placeholder="Email" pattern="[a-Z0-9._]+@[a-z0-9.-]+\.[a-z]{2,}$" required>
              </div>
          
              <div class="form-group">
                <label for="inputPhoneNumber">Phone number</label>
                <input type="text" name="phoneNumber" class="form-control" id="inputPhoneNumber" placeholder="Phone number" pattern="[0-9]{3}-[0-9]{7,8}" maxlength="12" required>
              </div>

              <div class="form-group 3">
                <label for="inputStreet">Street</label>
                <input type="text" name="street" class="form-control" id="inputStreet" placeholder="No.1 Jalan Johor" required>
              </div>
           
              <div class="form-group">
                <label for="inputCity">City</label>
                <select id="inputCity" class="form-control">
                  <option selected>Choose...</option>
                  <option>Johor Bahru</option>
                  <option>Alor Setar</option>
                  <option>Pasir Gudang</option>
                  <option>Malacca City</option>
                  <option>Seremban</option>
                  <option>Kuantan</option>
                  <option>Seberang Perai</option>
                  <option>Ipoh</option>
                  <option>Subang Jaya</option>
                  <option>Iskandar Puteri</option>
                  <option>Kuala Terengganu</option>
                  <option>Miri</option>
                  <option>Petaling Jaya</option>
                  <option>George Town</option>
                  <option>Kuala Lumpur</option>
                  <option>Kuching</option>
                  <option>Kota Kinabalu</option>
                  <option>Shah Alam</option>
                </select>
              </div>
          
              <div class="form-group">
                <label for="inputState">State</label>
                  <select id="inputState" class="form-control">
                    <option selected>Choose...</option>
                    <option>Johor</option>
                    <option>Kedah</option>
                    <option>Kelantan</option>
                    <option>Malacca</option>
                    <option>Negeri Sembilan</option>
                    <option>Pahang</option>
                    <option>Penang</option>
                    <option>Perak</option>
                    <option>Perlis</option>
                    <option>Sabah</option>
                    <option>Sarawak</option>
                    <option>Selangor</option>
                    <option>Terengganu</option>
                  </select>
              </div>

                <div class="form-group">
                  <label for="inputPostalCode">Postal code</label>
                  <input type="text" name="postalCode" class="form-control" id="inputPostalCode" placeholder="85200" required>
                </div>

                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary" ><i class="fas fa-save"></i> Save</button>
                </div>
		  
              </div>
      </form>
	</div>
</div>

<script>
// <!-- show tooltip -->
  $(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip({placement: "right"});   
  });

// <!-- tooltip automadically show when page load -->
  $('label').tooltip({
     trigger: 'manual'
  });
  $(document).ready(function() {
      $('label').tooltip('show');
      setTimeout(function(){ $('label').tooltip('hide'); }, 3000);
  });

  // <!-- tooltip show when mouse scroll -->
  $(document).ready(function(){
      $(window).on("scroll", function(){
         $('[data-toggle="tooltip"]').tooltip().mouseover();
         setTimeout(function(){ $('[data-toggle="tooltip"]').tooltip('hide'); }, 3000);
      });
  });
  </script>