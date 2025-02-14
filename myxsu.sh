source urls.sh

render_pages() {
	local short_url=$1
	local full_url=$2
	sed "s|🪰|$full_url|g" redirect_template.html > dist/$short_url.html
}

mkdir dist
for key in "${!urls[@]}"; do render_pages $key ${urls[$key]}; done
