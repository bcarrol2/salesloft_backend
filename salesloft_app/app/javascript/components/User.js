import React from "react"
import PropTypes from "prop-types"
class User extends React.Component {
  render () {
    return (
      <React.Fragment>
        Info: {this.props.info}
      </React.Fragment>
    );
  }
}

User.propTypes = {
  info: PropTypes.string
};
export default User
