# frozen_string_literal: true

require 'spec_helper'

describe 'kapacitor::repo' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      context 'manage repo' do
        let :params do
          {
            'manage_repo' => true,
            'repo_location' => 'https://repos.influxdata.com/',
            'repo_type' => 'stable',
          }
        end

        it do
          is_expected.to compile.with_all_deps
          is_expected.to contain_class('kapacitor::repo')

          case facts[:os]['family']
          when 'Debian'
            is_expected.to contain_apt__source('influxdata').with(
              'comment' => 'InfluxData repository',
              'location'   => "https://repos.influxdata.com/#{facts[:os]['name'].downcase}",
              'repos'      => 'stable',
              'key' => { 'id' => '05CE15085FC09D18E99EFB22684A14CF2582E0C5',
                         'source' => 'https://repos.influxdata.com/influxdb.key', }
            )
          when 'RedHat'
            is_expected.to contain_yumrepo('influxdata')
          end
        end
      end

      context 'not manage repo' do
        let :params do
          {
            'manage_repo' => false,
            'repo_location' => 'https://repos.influxdata.com/',
            'repo_type' => 'stable',
          }
        end

        it do
          is_expected.to compile.with_all_deps
          is_expected.to contain_class('kapacitor::repo')

          case facts[:os]['family']
          when 'Debian'
            is_expected.not_to contain_apt__source('influxdata')
          when 'RedHat'
            is_expected.not_to contain_yumrepo('influxdata')
          end
        end
      end
    end
  end
end
