<%@page import="java.util.ArrayList"%>
<%@page import="Models.Member"%>
<% ArrayList<Member> members = (ArrayList<Member>) request.getAttribute("members"); %>
<table class="member-table display w-100">
	<thead>
		<th>Member Id</th>
		<th>Name</th>
		<th>Email</th>
		<th>Gender</th>
		<th>Birthday</th>
	</thead>
	<tbody>
		<% if(members.size() != 0){ %>
			<% for(Member member : members) { %> 
			<tr>
				<td><a href="/admin/members/details?id=<%= member.getId() %>">LMM<%= member.getId() %></a></td>
				<td><%= member.getName() %></td>
				<td><%= member.getEmail() %></td>
				<td><%= member.getGender() != null ? member.getGender() : "-" %></td>
				<td><%= member.getBirthday() != null ? member.getBirthday().toString() : "-" %></td>
			</tr>
			<% } %>
		<% } %>
	</tbody>
</table>
<script defer>
    $(".member-table").DataTable({
		"columns": [
			{ "width": "10%"},
			{ "width": "25%"},
			{ "width": "25%"},
			{ "width": "10%"},
			{ "width": "25%"},
		]
	});
</script>