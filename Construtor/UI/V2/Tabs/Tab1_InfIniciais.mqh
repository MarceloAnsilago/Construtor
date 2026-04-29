#ifndef __CONSTRUTOR_V2_TAB1_INF_INICIAIS_MQH__
#define __CONSTRUTOR_V2_TAB1_INF_INICIAIS_MQH__

class CTab1InfIniciaisV2 : public CConstrutorV2PlaceholderTab
  {
public:
   bool Create(int window_index,CEF_CTabs &tabs,const int tab_index)
     {
      return(CreatePlaceholder(window_index,tabs,tab_index,"Inicio da V2 para informacoes iniciais. Use este arquivo para migrar os cards principais da tela v1."));
     }
  };

#endif // __CONSTRUTOR_V2_TAB1_INF_INICIAIS_MQH__
