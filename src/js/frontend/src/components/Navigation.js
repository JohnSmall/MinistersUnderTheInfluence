import React from "react";
import Radium from "radium";
import NavItem from './NavItem';
import HelpButton from '../containers/HelpButton';

class Navigation extends React.Component{

  constructor(props) {
    super(props)
  }

  render() {
    return (
      <div style={[
        styles.base,
      ]}>
        <ul className="navigation" style={[
          styles.ul,
        ]}>
          <HelpButton />
          <NavItem iconData={gitHubIconData} href='https://github.com/HackBrexit/MinistersUnderTheInfluence/' newTab={true}/>
        </ul>
      </div>
    )
  }
}

let styles = {
  base: {
    float: 'right',
    marginRight: '20px',
  },
  ul: {
    padding: '0',
  }
};

let gitHubIconData = "data:image/svg+xml;utf8;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pgo8IS0tIEdlbmVyYXRvcjogQWRvYmUgSWxsdXN0cmF0b3IgMTguMC4wLCBTVkcgRXhwb3J0IFBsdWctSW4gLiBTVkcgVmVyc2lvbjogNi4wMCBCdWlsZCAwKSAgLS0+CjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+CjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgdmVyc2lvbj0iMS4xIiBpZD0iQ2FwYV8xIiB4PSIwcHgiIHk9IjBweCIgdmlld0JveD0iMCAwIDQ3OC42MTMgNDc4LjYxMyIgc3R5bGU9ImVuYWJsZS1iYWNrZ3JvdW5kOm5ldyAwIDAgNDc4LjYxMyA0NzguNjEzOyIgeG1sOnNwYWNlPSJwcmVzZXJ2ZSIgd2lkdGg9IjY0cHgiIGhlaWdodD0iNjRweCI+CjxnIGlkPSJYTUxJRF8xMjJfIj4KCTxnPgoJCTxwYXRoIGQ9Ik00MjcuNTAxLDIwMC42OTVjMS43NzYtMTEuMjM4LDIuODg0LTIzLjU2LDMuMTYzLTM3LjM3N2MtMC4xMDctNTkuMjQ2LTI4LjQ2OC04MC4yMS0zMy45MjUtOTAuMDM4ICAgIGM4LjAzNy00NC44OS0xLjMzMS02NS4zMDktNS42ODgtNzIuMjk5Yy0xNi4wNy01LjcwNC01NS45MSwxNC43MjItNzcuNjc4LDI5LjEwMWMtMzUuNDkxLTEwLjM4OS0xMTAuNDk0LTkuMzc1LTEzOC42MjEsMi42ODkgICAgQzEyMi44NTYtNC4zODksOTUuNDA4LDEuMjc3LDk1LjQwOCwxLjI3N3MtMTcuNzQ1LDMxLjgyLTQuNjkxLDc4LjM3MWMtMTcuMDc1LDIxLjc1OS0yOS44MDIsMzcuMTQzLTI5LjgwMiw3Ny45NDkgICAgYzAsOS43NzMsMC42MDcsMTkuMDA4LDEuNjM3LDI3Ljg5M2MxNC43MDUsNzcuMzE4LDc1Ljk3LDExMC42NzQsMTM2LjE1LDExNi40MjZjLTkuMDU2LDYuODgxLTE5LjkyOCwxOS45MDMtMjEuNDMyLDM0Ljk5MiAgICBjLTExLjM3OSw3LjM1Ny0zNC4yNjgsOS43ODktNTIuMDY3LDQuMTkzYy0yNC45MzktNy44OC0zNC40ODYtNTcuMjY2LTcxLjgzMy01MC4yMjFjLTguMDgxLDEuNTEyLTYuNDc1LDYuODQyLDAuNTIzLDExLjM4NiAgICBjMTEuMzc4LDcuMzgsMjIuMDk0LDE2LjU1NCwzMC4zNTQsMzYuMTg1YzYuMzQ0LDE1LjA3MiwxOS42ODcsNDEuOTgyLDYxLjg3Myw0MS45ODJjMTYuNzQ3LDAsMjguNDc3LTEuOTc5LDI4LjQ3Ny0xLjk3OSAgICBzMC4zMTksMzguNDA2LDAuMzE5LDUzLjM4NWMwLDE3LjIzOC0yMy4yNjQsMjIuMDc4LTIzLjI2NCwzMC4zNDhjMCwzLjI4OSw3LjcsMy42MDEsMTMuODg4LDMuNjAxICAgIGMxMi4yMjksMCwzNy42NzMtMTAuMTg2LDM3LjY3My0yOC4xMDNjMC0xNC4yMzcsMC4yMjctNjIuMDgxLDAuMjI3LTcwLjQ2YzAtMTguMzA3LDkuODExLTI0LjEzNiw5LjgxMS0yNC4xMzYgICAgczEuMjAxLDk3LjcyNy0yLjM2MSwxMTAuODI5Yy00LjE3NywxNS40MDgtMTEuNzQ0LDEzLjIxOS0xMS43NDQsMjAuMDc2YzAsMTAuMjMzLDMwLjU4OSwyLjUwMiw0MC43MzUtMTkuODk3ICAgIGM3Ljg0OS0xNy40OTUsNC4zMzQtMTEzLjMzMSw0LjMzNC0xMTMuMzMxbDguMTgzLTAuMTc4YzAsMCwwLjA5NCw0My44OTItMC4xODgsNjMuOTQ0Yy0wLjI5NSwyMC43NjktMi40MzgsNDcuMDI1LDkuODk4LDU5LjQxNyAgICBjOC4wOTcsOC4xNSwzMi45MDMsMjIuNDUxLDMyLjkwMyw5LjM4MmMwLTcuNTc0LTE3LjM3MS0xMy44MzMtMTcuMzcxLTM0LjM1M1YzNDQuNDVjMTAuNTUzLDAsMTIuNzM0LDMxLjA3MiwxMi43MzQsMzEuMDcyICAgIGwzLjgwNCw1Ny43MjdjMCwwLTIuNTI2LDIxLjA2NSwyMi43NTYsMjkuODU2YzguOTI1LDMuMTI2LDI4LjAxOCwzLjk3NiwyOC45MTMtMS4yNzFjMC44OTctNS4yNi0yMi45OS0xMy4wMzgtMjMuMjE3LTI5LjM0MiAgICBjLTAuMTIzLTkuOTMsMC40NDUtMTUuNzQyLDAuNDQ1LTU4LjkzNGMwLTQzLjE2OC01Ljc5OS01OS4xMzctMjYuMDA3LTcxLjg2M0MzNTUuNjY5LDI5NS42ODEsNDE2LjUzNiwyNjkuNTEsNDI3LjUwMSwyMDAuNjk1eiIgZmlsbD0iI0ZGRkZGRiIvPgoJPC9nPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+Cjwvc3ZnPgo=";

export default Radium(Navigation);
