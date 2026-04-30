#ifndef __CONSTRUTOR_V2_TAB8_SINAIS_MAIN_VIEW_MQH__
#define __CONSTRUTOR_V2_TAB8_SINAIS_MAIN_VIEW_MQH__

#include "Tab8Shared.mqh"

class CTab8SinaisMainView : public CEF_CWndCreate
  {
private:
   CEF_CWndCreate *m_host;
   bool            m_created;
   int             m_window_index;
   int             m_tab_index;

   CEF_CFrame      m_card_ordens;
   CEF_CTextLabel  m_card_ordens_title;
   CEF_CTextLabel  m_card_ordens_body;
   CEF_CFrame      m_card_filtro;
   CEF_CTextLabel  m_card_filtro_title;
   CEF_CTextLabel  m_card_filtro_body;
   CEF_CFrame      m_card_canais;
   CEF_CTextLabel  m_card_canais_title;
   CEF_CTextLabel  m_card_canais_body;
   CEF_CFrame      m_card_cruz;
   CEF_CTextLabel  m_card_cruz_title;
   CEF_CTextLabel  m_card_cruz_body;
   CEF_CFrame      m_card_sobre;
   CEF_CTextLabel  m_card_sobre_title;
   CEF_CTextLabel  m_card_sobre_body;

public:
                     CTab8SinaisMainView(void) : m_host(NULL), m_created(false), m_window_index(-1), m_tab_index(-1) {}

   bool Create(CEF_CWndCreate &host,int window_index,CEF_CTabs &tabs,const int tab_index)
     {
      if(m_created)
         return(true);

      m_host=&host;
      m_window_index=window_index;
      m_tab_index=tab_index;

      const int tabs_w=tabs.XSize();
      const int content_pad=24;
      const int content_y=82;
      const int content_w=tabs_w-(content_pad*2);
      const int gap=12;
      const int col_w=(content_w-(gap*2))/3;
      const int row_h=216;

      if(!V2CreateSectionPlaceholder(*m_host,m_card_ordens,m_card_ordens_title,m_card_ordens_body,tabs,tabs,m_window_index,m_tab_index,content_pad,content_y,col_w,row_h,"Tipo de ordens","Primeiro bloco a migrar. Aqui entram market, limit e a logica de exclusividade entre opcoes."))
         return(false);
      if(!V2CreateSectionPlaceholder(*m_host,m_card_filtro,m_card_filtro_title,m_card_filtro_body,tabs,tabs,m_window_index,m_tab_index,content_pad+col_w+gap,content_y,col_w,row_h,"Filtro","Bloco isolavel. Deve portar padrao, timeframe e ranges sem depender da navegacao complexa da aba 8."))
         return(false);
      if(!V2CreateSectionPlaceholder(*m_host,m_card_canais,m_card_canais_title,m_card_canais_body,tabs,tabs,m_window_index,m_tab_index,content_pad+(col_w+gap)*2,content_y,col_w,row_h,"Canais","Migracao propria para canais e bandas, com yes/no e parametros de indicador."))
         return(false);
      if(!V2CreateSectionPlaceholder(*m_host,m_card_cruz,m_card_cruz_title,m_card_cruz_body,tabs,tabs,m_window_index,m_tab_index,content_pad,content_y+row_h+gap,col_w,row_h,"Cruzamentos","Bloco mais sensivel de Sinais. Depende de tabs internas, atalhos e combinacao fast/slow."))
         return(false);
      if(!V2CreateSectionPlaceholder(*m_host,m_card_sobre,m_card_sobre_title,m_card_sobre_body,tabs,tabs,m_window_index,m_tab_index,content_pad+col_w+gap,content_y+row_h+gap,col_w,row_h,"Sobrecomprado / sobrevenda","Segundo bloco mais delicado. Tem indicador dinamico, parametros por familia e navegacao interna."))
         return(false);

      m_created=true;
      return(true);
     }
  };

#endif // __CONSTRUTOR_V2_TAB8_SINAIS_MAIN_VIEW_MQH__
