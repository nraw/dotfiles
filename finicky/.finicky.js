// Save as ~/.finicky.js
// Additional config ideas https://github.com/johnste/finicky/wiki/Configuration-ideas

module.exports = {
    defaultBrowser: "Google Chrome",
    options: {
		    hideIcon: true,
		},
    handlers: [
        {
            match: ["zoom.us/j/*", "*.zoom.us/j/*"],
            browser: "us.zoom.xos"
        },
				{
					match: ({ url }) => url.protocol === "slack",
					browser: "/Applications/Slack.app"
				},
        // {
        //     match: "open.spotify.com/*",
        //     browser: "Spotify"
        // },
        {
            match: finicky.matchHostnames(['teams.microsoft.com']),
            browser: 'com.microsoft.teams',
            url({ url }) {
                return {
                    ...url,
                    protocol: 'msteams',
                };
            },
        },
    ],
	  rewrite: [
    {
      match: [
        '*.slack.com/*',
      ],
      url: function({ url, urlString }) {
        const subdomain = url.host.slice(0, -10)
        const pathParts = url.pathname.split("/")

        let team, patterns = {}
        if (subdomain != 'app') {
          switch (subdomain) {
            case '<teamname>':
            case '<corpname>.enterprise':
              team = 'T00000000'
              break
            default:
              finicky.notify(
                `No Slack team ID found for ${url.host}`, 
                `Add the team ID to ~/.finicky.js to allow direct linking to Slack.`
              )
              return url
          }
          
          if (subdomain.slice(-11) == '.enterprise') {
            patterns = {
              'file': [/\/files\/\w+\/(?<id>\w+)/]
            }
          } else {
            patterns = {
              'file': [/\/messages\/\w+\/files\/(?<id>\w+)/],
              'team': [/(?:\/messages\/\w+)?\/team\/(?<id>\w+)/],
              'channel': [/\/(?:messages|archives)\/(?<id>\w+)(?:\/(?<message>p\d+))?/]
            }
          }
        } else {
          patterns = {
            'file': [
              /\/client\/(?<team>\w+)\/\w+\/files\/(?<id>\w+)/,
              /\/docs\/(?<team>\w+)\/(?<id>\w+)/
            ],
            'team': [/\/client\/(?<team>\w+)\/\w+\/user_profile\/(?<id>\w+)/],
            'channel': [/\/client\/(?<team>\w+)\/(?<id>\w+)(?:\/(?<message>[\d.]+))?/]
          }
        }
        
        for (let [host, host_patterns] of Object.entries(patterns)) {
          for (let pattern of host_patterns) {
            let match = pattern.exec(url.pathname)
            if (match) {
              let search = `team=${team || match.groups.team}`

              if (match.groups.id) {
                search += `&id=${match.groups.id}`
              }

              if (match.groups.message) {
                let message = match.groups.message
                if (message.charAt(0) == 'p') {
                  message = message.slice(1, 11) + '.' + message.slice(11)
                }
                search += `&message=${message}`
              }

              let output = {
                protocol: "slack",
                username: "",
                password: "",
                host: host,
                port: null,
                pathname: "",
                search: search,
                hash: ""
              }
              let outputStr = `${output.protocol}://${output.host}?${output.search}`
              finicky.log(`Rewrote Slack URL ${urlString} to deep link ${outputStr}`)
              return output
            }
          }
        }

        return url
      }
    }
  ]
}
