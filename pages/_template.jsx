import React from 'react'
import { Container } from 'react-responsive-grid'
import { Link } from 'react-router'
import { prefixLink } from 'gatsby-helpers'
import Headroom from 'react-headroom'
import '../css/markdown-styles'
import { config } from 'config'
import LinksBar from '../components/LinksBar'
import Bio from '../components/Bio'

import { rhythm } from '../utils/typography'

module.exports = React.createClass({
  propTypes () {
    return {
      children: React.PropTypes.any,
    }
  },
  render () {
    return (
      <div>
        <Headroom >
         <Link  to="/" className="topper">{config.siteName}</Link>
        </Headroom>
       
        <hr style={{marginTop: '1.07rem'}}/>
        <Bio/>
        <LinksBar/>
        <Container
          style={{
            maxWidth: 960,
            padding: `${rhythm(1)} ${rhythm(3/4)}`,
            paddingTop: 50,
          }}
        >
          {this.props.children}
        </Container>
      </div>
    )
  },
})
