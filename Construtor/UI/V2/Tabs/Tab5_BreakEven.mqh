#ifndef __CONSTRUTOR_V2_TAB5_BREAK_EVEN_MQH__
#define __CONSTRUTOR_V2_TAB5_BREAK_EVEN_MQH__

class CTab5BreakEvenV2 : public CConstrutorV2PlaceholderTab
  {
public:
   bool Create(CEF_CWndCreate &host,int window_index,CEF_CTabs &tabs,const int tab_index)
     {
      return(CreatePlaceholder(host,window_index,tabs,tab_index,"Estrutura reservada para break even. Este arquivo fica dono exclusivo dessa regra na V2."));
     }
  };

#endif // __CONSTRUTOR_V2_TAB5_BREAK_EVEN_MQH__
