#ifndef __CONSTRUTOR_V2_TAB10_MONTAGEM_MQH__
#define __CONSTRUTOR_V2_TAB10_MONTAGEM_MQH__

class CTab10MontagemV2 : public CConstrutorV2PlaceholderTab
  {
public:
   bool Create(int window_index,CEF_CTabs &tabs,const int tab_index)
     {
      return(CreatePlaceholder(window_index,tabs,tab_index,"Estrutura reservada para montagem da estrategia. Esse ponto fecha o grupo de parametrizacao e montagem da V2."));
     }
  };

#endif // __CONSTRUTOR_V2_TAB10_MONTAGEM_MQH__
