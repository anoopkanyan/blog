module ApplicationHelper

	class HTMLwithPygments < Redcarpet::Render::HTML
		def block_code(code, language)
			Pygments.highlight(code, lexer:language)
		end
	end

	def markdown(content)
		renderer = HTMLwithPygments.new(hard_wrap: true, filter_html: false)
		options = {
			autolink: true,
			no_intra_emphasis: true,
			disable_indented_code_blocks: true,
			fenced_code_blocks: true,
			lax_html_blocks: true,
			strikethrough: true,
			superscript: true,	
		}

		Redcarpet::Markdown.new(renderer, options).render(content).html_safe

	end	

	def youtube_embed_post(youtube_url)
      if youtube_url[/youtu\.be\/([^\?]*)/]
        youtube_id = $1
      else
        # Regex from # http://stackoverflow.com/questions/3452546/javascript-regex-how-to-get-youtube-video-id-from-url/4811367#4811367
        youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
        youtube_id = $5
      end
      %Q{<iframe title="YouTube video player" id="post_youtube" src="http://www.youtube.com/embed/#{ youtube_id }" frameborder="0" allowfullscreen></iframe>}
    end



    def youtube_embed_main(youtube_url)
      if youtube_url[/youtu\.be\/([^\?]*)/]
        youtube_id = $1
      else
        # Regex from # http://stackoverflow.com/questions/3452546/javascript-regex-how-to-get-youtube-video-id-from-url/4811367#4811367
        youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
        youtube_id = $5
      end
      %Q{<iframe title="YouTube video player" width="100%" height="100%" src="http://www.youtube.com/embed/#{ youtube_id }" frameborder="0" allowfullscreen></iframe>}
    end

end
