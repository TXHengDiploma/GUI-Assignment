<div class="modal-dialog" role="document">
	<div class="modal-content">
		<div class="modal-header">
			<h5 class="modal-title">Add New Brand</h5>
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<form action="/admin/brands/add" method="post">
			<div class="modal-body">
				<div class="form-group">
					<label>Name: </label>
					<input name="brand_name" type="text" class="form-control" placeholder="Enter Brand Name" maxlength="100" required>
				</div>
				<div class="form-group">
					<label for="brand_desc">Description: </label>
					<textarea name="brand_desc" cols="30" rows="10" class="form-control" placeholder="Enter Brand Description"></textarea>
				</div>
				<div class="form-group">
					<label>Image: </label>
					<input id="inp" type="file" class="form-control" accept="image/*">
					<input name="brand_img" type="hidden" id="b64">
					<div class="d-flex w-100 justify-content-center align-item-center">
						<img id="img_preview" height="200" src="">
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary">Save</button>
			</div>
		</form>
	</div>
</div>
<script defer>
function readFile() {
	if (this.files && this.files[0]) {
		var FR= new FileReader();
		FR.addEventListener("load", function(e) {
			document.getElementById("img_preview").src = e.target.result;
			document.getElementById("b64").value = e.target.result;
		}); 
		FR.readAsDataURL( this.files[0] );
	}
}
document.getElementById("inp").addEventListener("change", readFile);
</script>