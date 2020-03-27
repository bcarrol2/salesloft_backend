import React from "react"
import PropTypes from "prop-types"

class Users extends React.Component {
  render() {
    return (
      <div>
        <h1>All Users</h1>
        <ul>
          {this.props.users.map(user => (
            <li key={user.id}>Name: {`${user.first_name} ${user.last_name}`} Email: {`${user.email}`}</li>
          ))}
        </ul>
      </div>
    );
  }
}
export default Users
