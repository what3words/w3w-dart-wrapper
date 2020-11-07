/// Sets the kind of input accepted by autosuggest
class AutosuggestInputType {
  ///Text typed by a user, e.g.'index.home.raf'. Default setting.
  ///Expects exactly two dots and no whitespace in the input.
  static AutosuggestInputType TEXT = AutosuggestInputType('text');

  ///JSON from Nuance VoCon&reg; Hybrid.
  ///This should only be used with grammars provided by what3words ltd;
  ///using other grammars will cause run-time exceptions.
  ///Language detection is disabled, so lang must be set for non-English input.
  static AutosuggestInputType VOCON_HYBRID =
      AutosuggestInputType('vocon-hybrid');

  ///Text from the Nuance server at https://dictation.nuancemobility.net/NMDPAsrCmdServlet/dictation -
  ///please contact Nuance before attempting to use this server.
  ///Use with text from any other source is unsupported and results may not be as expected.
  ///Does not handle text in languages in which words are not separated by spaces, e.g. Chinese.
  ///Language detection is disabled, so lang must be set for non-English input.
  static AutosuggestInputType NMDP_ASR = AutosuggestInputType('nmdp-asr');

  ///Text output from speech recognition software. E.g. "index home raft".
  ///This input type handles spaces between words.
  ///Users should not pronounce 'dot' when speaking a 3 word address.
  ///Does not handle text in languages in which words are not separated by spaces, e.g. Chinese.
  ///Language detection is disabled, so lang must be set.
  static AutosuggestInputType GENERIC_VOICE =
      AutosuggestInputType('generic-voice');

  ///Text from Speechmatics voice recognition.
  ///Use with text from any other source is unsupported and results may not be as expected.
  ///This should only be used with grammars provided by what3words ltd;
  ///using other grammars will cause run-time exceptions.
  ///Language detection is disabled, so language must be set.
  static AutosuggestInputType SPEECHMATICS =
      AutosuggestInputType('speechmatics');

  String value;
  AutosuggestInputType(this.value);
}
