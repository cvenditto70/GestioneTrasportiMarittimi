-CREATE UNIQUE INDEX biglietto_codiceqr_key ON public.biglietto USING btree (codiceqr);

CREATE UNIQUE INDEX biglietto_pkey ON public.biglietto USING btree (id_biglietto);

CREATE INDEX idx_biglietto_codiceqr ON public.biglietto USING btree (codiceqr);

CREATE INDEX idx_biglietto_datavalidita ON public.biglietto USING btree ("datavalidità");

CREATE INDEX idx_biglietto_flag ON public.biglietto USING btree (flagcancellato);

CREATE INDEX idx_biglietto_flagcancellato ON public.biglietto USING btree (flagcancellato);

CREATE INDEX idx_biglietto_id_passeggero ON public.biglietto USING btree (id_passeggero);

CREATE INDEX idx_biglietto_id_prenotazione ON public.biglietto USING btree (id_prenotazione);

CREATE INDEX idx_biglietto_id_viaggio ON public.biglietto USING btree (id_viaggio);

CREATE INDEX idx_biglietto_stato ON public.biglietto USING btree (stato);

CREATE UNIQUE INDEX canaledivendita_pkey ON public.canaledivendita USING btree (id_canaledivendita);

CREATE UNIQUE INDEX compagnia_nome_key ON public.compagnia USING btree (nome);

CREATE UNIQUE INDEX compagnia_pkey ON public.compagnia USING btree (id_compagnia);

CREATE UNIQUE INDEX metodopagamento_descrizionemetodo_key ON public.metodopagamento USING btree (descrizionemetodo);

CREATE UNIQUE INDEX metodopagamento_pkey ON public.metodopagamento USING btree (id_metodopagamento);

CREATE UNIQUE INDEX nave_pkey ON public.nave USING btree (id_nave);

CREATE INDEX idx_passeggero_cognome ON public.passeggero USING btree (cognome);

CREATE UNIQUE INDEX passeggero_email_key ON public.passeggero USING btree (email);

CREATE UNIQUE INDEX passeggero_pkey ON public.passeggero USING btree (id_passeggero);

CREATE INDEX idx_prenotazione_flag ON public.prenotazione USING btree (flagcancellato);

CREATE INDEX idx_prenotazione_flagcancellato_2 ON public.prenotazione USING btree (flagcancellato);

CREATE INDEX idx_prenotazione_id_metodo ON public.prenotazione USING btree (id_metodopagamento);

CREATE INDEX idx_prenotazione_id_passeggero ON public.prenotazione USING btree (id_passeggero);

CREATE INDEX idx_prenotazione_id_passeggero_2 ON public.prenotazione USING btree (id_passeggero);

CREATE UNIQUE INDEX prenotazione_pkey ON public.prenotazione USING btree (id_prenotazione);

CREATE INDEX idx_scalo_id_tratta ON public.scalo USING btree (id_tratta);

CREATE UNIQUE INDEX scalo_pkey ON public.scalo USING btree (id_scalo);

CREATE UNIQUE INDEX statoprenotazione_descrizionestato_key ON public.statoprenotazione USING btree (descrizionestato);

CREATE UNIQUE INDEX statoprenotazione_pkey ON public.statoprenotazione USING btree (id_statoprenotazione);

CREATE UNIQUE INDEX statoviaggio_descrizionestato_key ON public.statoviaggio USING btree (descrizionestato);

CREATE UNIQUE INDEX statoviaggio_pkey ON public.statoviaggio USING btree (id_statoviaggio);

CREATE UNIQUE INDEX tipoveicolo_descrizionetipo_key ON public.tipoveicolo USING btree (descrizionetipo);

CREATE UNIQUE INDEX tipoveicolo_pkey ON public.tipoveicolo USING btree (id_tipoveicolo);

CREATE UNIQUE INDEX tratta_pkey ON public.tratta USING btree (id_tratta);

CREATE UNIQUE INDEX veicolo_pkey ON public.veicolo USING btree (id_veicolo);

CREATE UNIQUE INDEX veicolo_targa_key ON public.veicolo USING btree (targa);

CREATE INDEX idx_viaggio_id_nave ON public.viaggio USING btree (id_nave);

CREATE INDEX idx_viaggio_id_tratta ON public.viaggio USING btree (id_tratta);

CREATE UNIQUE INDEX viaggio_pkey ON public.viaggio USING btree (id_viaggio);
