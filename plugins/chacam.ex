defmodule ChadevBot.Chacam do
  @moduledoc """
  This plugin returns random camera stills from street cameras in the 
  Chattanooga area that are maintained by the Tennessee Department of Transportation:
      http://ww2.tdot.state.tn.us/tsw/smartmap.htm

  I got this idea from not having windows on the 4th Floor and needing to know
  what the weather conditions are like outside.


  ## Usage:


     butler> butler chacam

  Author: Sean Brewer (seabre)
  """

  require Record
  use Butler.Plugin

  Record.defrecord :xmlElement, Record.extract(:xmlElement, from_lib: "xmerl/include/xmerl.hrl")
  Record.defrecord :xmlText, Record.extract(:xmlText, from_lib: "xmerl/include/xmerl.hrl")

  @url "http://ww2.tdot.state.tn.us/tsw/GeoRSS/TDOTCameraGeorss.xml"
  @tdot_url "http://ww2.tdot.state.tn.us/tsw/smartmap.htm"


  def elements_to_list_of_maps(els) do
    Enum.map els, fn(i) ->
      xmlElement(i, :content)
      |> Enum.filter(&(Record.is_record(&1, :xmlElement)))
      |> Enum.reduce Map.new, fn(el, acc) ->
        nm = Atom.to_string(xmlElement(el, :name))
        [content] = xmlElement(el, :content)
        Map.put(acc, nm, to_string(xmlText(content, :value)))
      end
    end
  end

  def chattanooga_cameras(els) do
    Enum.filter elements_to_list_of_maps(els), fn(i) ->
      String.contains?(i["link"], "cctvchatt")
    end
  end

  def parse_xml(body) do
    {root, _} = 
      body 
      |> :binary.bin_to_list 
      |> :xmerl_scan.string

    entry_els = :xmerl_xpath.string('.//entry', root)

    entry_els
  end

  def choose_camera(body) do
    :random.seed(:os.timestamp)
    cams = chattanooga_cameras(parse_xml(body))

    hd(Enum.take_random(cams, 1))
  end

  def camera_message(body) do
    cam = choose_camera(body)

    "Here's what it looks like at #{cam["summary"]}: #{cam["imageurl"]} See more at #{@tdot_url}."
  end

  def get_cams() do
    case HTTPoison.get(@url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        camera_message(body)
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        "Sorry. The feed isn't available right now."
      {:error, %HTTPoison.Error{reason: reason}} ->
        "Oops. Something's wrong with the camera feed. This might help: #{reason}"
    end
  end

  respond ~r/chacam/, conn do
    reply conn, "#{get_cams()}"
  end
end
