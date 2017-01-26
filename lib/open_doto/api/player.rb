# frozen_string_literal: true
module OpenDoto
  module API
    # :nodoc:
    class Player
      attr_reader :response
      def initialize(response)
        @response = response
      end

      def valid?
        !account_id.nil?
      end

      def account_id
        profile['account_id']
      end

      def avatar(size = nil)
        avatar_for(size)
      end

      def cheese
        profile['cheese']
      end

      def last_login_at
        profile['last_login']
      end

      def location_country_code
        profile['loccountrycode']
      end

      def name
        profile['name']
      end

      def party_mmr
        response['competitive_rank']
      end

      def persona_name
        profile['personaname']
      end

      def profile_url
        profile['profileurl']
      end

      def solo_mmr
        response['solo_competitive_rank']
      end

      def steam_id
        profile['steamid']
      end

      def untracked_at
        response['tracked_until']
      end

      private

      def profile
        response['profile'] || {}
      end

      def avatar_for(size)
        case size
        when :medium
          profile['avatarmedium']
        when :full
          profile['avatarfull']
        else
          profile['avatar']
        end
      end
    end
  end
end
