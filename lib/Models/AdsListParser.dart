class AdsListParser {
  String ad_position,
      ad_screen,
      pavilion_id,
      media_type,
      media_url,
      bigthumb_url,
      smallthumb_url,
      link_type,
      link_url;

  AdsListParser({
    this.ad_position,
    this.ad_screen,
    this.pavilion_id,
    this.media_type,
    this.media_url,
    this.bigthumb_url,
    this.smallthumb_url,
    this.link_type,
    this.link_url,
  });

  factory AdsListParser.fromJson(Map<String, dynamic> json) => AdsListParser(
      ad_position: json["ad_position"],
      ad_screen: json["ad_screen"],
      pavilion_id: json["pavilion_id"],
      media_type: json["media_type"],
      media_url: json["media_url"],
      bigthumb_url: json["bigthumb_url"],
      smallthumb_url: json["smallthumb_url"],
      link_type: json["link_type"],
      link_url: json["link_url"]);
}
