function Set-DnsResolver {
    [CmdletBinding(SupportsShouldProcess)]
    Param(
        [Parameter()]
        [ValidateSet('Google', 'Cloudflare', 'Quad9')]
        [string]$Resolver = 'Google'
    )

    if ($PSCmdlet.ShouldProcess($Resolver)) {
        $script:DnsResolver = switch ($Resolver) {
            'Google' {
                [PSCustomObject]@{
                    Resolver      = $Resolver
                    BaseUri       = 'https://dns.google/resolve'
                    QueryTemplate = '{0}?name={1}&type={2}'
                }
            }
            'CloudFlare' {
                [PSCustomObject]@{
                    Resolver      = $Resolver
                    BaseUri       = 'https://cloudflare-dns.com/dns-query'
                    QueryTemplate = '{0}?name={1}&type={2}'
                }
            }
            'Quad9' {
                [PSCustomObject]@{
                    Resolver      = $Resolver
                    BaseUri       = 'https://dns.quad9.net:5053/dns-query'
                    QueryTemplate = '{0}?name={1}&type={2}'
                }
            }
        }
    }
}
