<div class="modal-dialog" role="document">
	<div class="modal-content">
		<div class="modal-header">
			<h5 class="modal-title">Add Address</h5>
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<form action="/member/addresses/add" method="post">
			<div class="modal-body">

				<div class="form-group">
				<label for="inputRemarkName">Address Remark Name</label>
				<input type="text" name="remarkName" class="form-control" id="inputRemarkName" placeholder="e.g: Company" required>
				</div>

				<div class="form-group">
				<label for="inputReceiverName">Receiver Name</label>
				<input type="text" name="receiverName" class="form-control" id="inputReceiverName" placeholder="Name"
					required>
				</div>


				<div class="form-group">
				<label for="inputEmail">Receiver Email</label>
				<input type="text" name="email" class="form-control" id="inputEmail" placeholder="Email"
					pattern="[a-Z0-9._]+@[a-z0-9.-]+\.[a-z]{2,}$" required>
				</div>

				<div class="form-group">
				<label for="inputPhoneNumber">Phone number</label>
				<input type="text" name="phoneNumber" class="form-control" id="inputPhoneNumber" placeholder="Phone number"
					pattern="[0-9]{3}-[0-9]{7,8}" maxlength="12" required>
				</div>

				<div class="form-group 3">
				<label for="inputStreet">Street</label>
				<input type="text" name="street" class="form-control" id="inputStreet" placeholder="No.1 Jalan Johor"
					required>
				</div>

				<div class="form-group">
				<label for="inputState">State</label>
				<input type="text" class="form-control" id="inputState" requierd name="state">
				<!-- <select id="inputState" class="form-control" required name="state">
					<option value="" selected>-- Select a State --</option>
					<option value="Johor">Johor</option>
					<option value="Kedah">Kedah</option>
					<option value="Kelantan">Kelantan</option>
					<option value="Melacca">Malacca</option>
					<option value="Negeri Sembilan">Negeri Sembilan</option>
					<option value="Pahang">Pahang</option>
					<option value="Penang">Penang</option>
					<option value="Perak">Perak</option>
					<option value="Perlis">Perlis</option>
					<option value="Sabah">Sabah</option>
					<option value="Sarawak">Sarawak</option>
					<option value="Selangor">Selangor</option>
					<option value="Terengganu">Terengganu</option>
				</select> -->
				</div>

				<div class="form-group">
				<label for="inputCity">City</label>
				<input type="text" class="form-control" id="inputCity" requierd name="city">
				<!-- <select id="inputCity" class="form-control" required name="city">
					<option value="" selected>-- Select a City --</option>
					<option value="Johor Bahru">Johor Bahru</option>
					<option value="Alor Setar">Alor Setar</option>
					<option value="Pasir Gudang">Pasir Gudang</option>
					<option value="Melacca City">Malacca City</option>
					<option value="Seremban">Seremban</option>
					<option value="Kuantan">Kuantan</option>
					<option value="Seberang Perai">Seberang Perai</option>
					<option value="Ipoh">Ipoh</option>
					<option value="Subang Jaya">Subang Jaya</option>
					<option value="Iskandar Puteri">Iskandar Puteri</option>
					<option value="Kuala Terengganu">Kuala Terengganu</option>
					<option value="Miri">Miri</option>
					<option value="Petaling Jaya">Petaling Jaya</option>
					<option value="George Town">George Town</option>
					<option value="Kuala Lumpur">Kuala Lumpur</option>
					<option value="Kuching">Kuching</option>
					<option value="Kota Kinabalu">Kota Kinabalu</option>
					<option value="Shah Alam">Shah Alam</option>
				</select> -->
				</div>

				<div class="form-group">
				<label for="inputPostalCode">Postal code</label>
				<input type="text" maxlength="5" name="postalCode" class="form-control" id="inputPostalCode" placeholder="85200" required>
				</div>
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary">Save</button>
			</div>
		</form>
	</div>
</div>

<script>
</script>