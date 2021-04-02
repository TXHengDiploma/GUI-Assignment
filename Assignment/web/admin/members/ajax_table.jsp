<%@page import="java.util.ArrayList"%>
<%@page import="Models.Member"%>
<% ArrayList<Member> members = (ArrayList<Member>) request.getAttribute("members"); %>
<table class="member-table display w-100">
	<thead>
		<th class="sorting">Name</th>
		<th>Email</th>
		<th>Gender</th>
		<th>Birthday</th>
	</thead>
	<tbody>
		<% if(members.size() != 0){ %>
			<% for(Member member : members) { %> 
			<tr>
				<td><%= member.getName() %></td>
				<td><%= member.getEmail() %></td>
				<td><%= member.getGender() != null ?member.getGender() : "not set yet" %></td>
				<td><%= member.getBirthday() != null ?member.getBirthday() : "not set yet" %></td>
			</tr>
			<% } %>
		<% } %>
	</tbody>
</table>
<script defer>
    $(".member-table").DataTable({
		"columns": [
			{ "width": "25%", "orderable": false },
			{ "width": "30%" },
			{ "width": "15%" },
			{ "width": "25%", "orderable": false },
		]
	});
</script>