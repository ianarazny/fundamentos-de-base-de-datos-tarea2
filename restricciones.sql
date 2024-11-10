--
-- Name: ciudades ciudades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ciudades
    ADD CONSTRAINT ciudades_pkey PRIMARY KEY (pais_codigo, division_politica_codigo, ciudad_codigo);


--
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (cliente_documento);


--
-- Name: continentes continentes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.continentes
    ADD CONSTRAINT continentes_pkey PRIMARY KEY (continente_codigo);


--
-- Name: costos_habitacion costos_habitacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.costos_habitacion
    ADD CONSTRAINT costos_habitacion_pkey PRIMARY KEY (hotel_codigo, nro_habitacion, fecha_desde);


--
-- Name: divisiones_politicas divisiones_politicas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.divisiones_politicas
    ADD CONSTRAINT divisiones_politicas_pkey PRIMARY KEY (pais_codigo, division_politica_codigo);


--
-- Name: estadias_anteriores estadias_anteriores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estadias_anteriores
    ADD CONSTRAINT estadias_anteriores_pkey PRIMARY KEY (hotel_codigo, nro_habitacion, cliente_documento, check_in);


--
-- Name: habitaciones habitaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.habitaciones
    ADD CONSTRAINT habitaciones_pkey PRIMARY KEY (hotel_codigo, nro_habitacion);


--
-- Name: hoteles hoteles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hoteles
    ADD CONSTRAINT hoteles_pkey PRIMARY KEY (hotel_codigo);


--
-- Name: limitan limitan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.limitan
    ADD CONSTRAINT limitan_pkey PRIMARY KEY (pais1_codigo, pais2_codigo);


--
-- Name: ocupaciones ocupaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ocupaciones
    ADD CONSTRAINT ocupaciones_pkey PRIMARY KEY (ocupacion_codigo);


--
-- Name: paises paises_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paises
    ADD CONSTRAINT paises_pkey PRIMARY KEY (pais_codigo);


--
-- Name: reservas_anteriores reservas_anteriores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas_anteriores
    ADD CONSTRAINT reservas_anteriores_pkey PRIMARY KEY (hotel_codigo, nro_habitacion, cliente_documento, fecha_reserva);


--
-- Name: tipos_habitacion tipos_habitacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipos_habitacion
    ADD CONSTRAINT tipos_habitacion_pkey PRIMARY KEY (tipo_habitacion_codigo);


--
-- Name: iciudades_clientes; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iciudades_clientes ON public.clientes USING btree (pais_codigo, division_politica_codigo, ciudad_codigo);


--
-- Name: iciudades_hoteles; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iciudades_hoteles ON public.hoteles USING btree (pais_codigo, division_politica_codigo, ciudad_codigo);


--
-- Name: iclientes_estadias_anteriores; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iclientes_estadias_anteriores ON public.estadias_anteriores USING btree (cliente_documento);


--
-- Name: iclientes_reservas_anteriores; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iclientes_reservas_anteriores ON public.reservas_anteriores USING btree (cliente_documento);


--
-- Name: icontinentes; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX icontinentes ON public.paises USING btree (continente_codigo);


--
-- Name: idivisiones_politicas; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idivisiones_politicas ON public.ciudades USING btree (pais_codigo, division_politica_codigo);


--
-- Name: ihabitaciones_costoshabitacion; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ihabitaciones_costoshabitacion ON public.costos_habitacion USING btree (hotel_codigo, nro_habitacion);


--
-- Name: ihabitaciones_estadias_anteriores; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ihabitaciones_estadias_anteriores ON public.estadias_anteriores USING btree (hotel_codigo, nro_habitacion);


--
-- Name: ihabitaciones_reservas_anteriores; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ihabitaciones_reservas_anteriores ON public.reservas_anteriores USING btree (hotel_codigo, nro_habitacion);


--
-- Name: ihabitaciones_tiposhabitacion; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ihabitaciones_tiposhabitacion ON public.habitaciones USING btree (tipo_habitacion_codigo);


--
-- Name: ipaises; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ipaises ON public.divisiones_politicas USING btree (pais_codigo);


--
-- Name: ipaises1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ipaises1 ON public.limitan USING btree (pais1_codigo);


--
-- Name: ipaises2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ipaises2 ON public.limitan USING btree (pais2_codigo);


--
-- Name: clientes fciudades_clientes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT fciudades_clientes FOREIGN KEY (pais_codigo, division_politica_codigo, ciudad_codigo) REFERENCES public.ciudades(pais_codigo, division_politica_codigo, ciudad_codigo);


--
-- Name: hoteles fciudades_hoteles; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hoteles
    ADD CONSTRAINT fciudades_hoteles FOREIGN KEY (pais_codigo, division_politica_codigo, ciudad_codigo) REFERENCES public.ciudades(pais_codigo, division_politica_codigo, ciudad_codigo);


--
-- Name: estadias_anteriores fclientes_estadias_anteriores; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estadias_anteriores
    ADD CONSTRAINT fclientes_estadias_anteriores FOREIGN KEY (cliente_documento) REFERENCES public.clientes(cliente_documento);


--
-- Name: reservas_anteriores fclientes_reservas_anteriores; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas_anteriores
    ADD CONSTRAINT fclientes_reservas_anteriores FOREIGN KEY (cliente_documento) REFERENCES public.clientes(cliente_documento);


--
-- Name: paises fcontinentes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paises
    ADD CONSTRAINT fcontinentes FOREIGN KEY (continente_codigo) REFERENCES public.continentes(continente_codigo);


--
-- Name: ciudades fdivisiones_politicas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ciudades
    ADD CONSTRAINT fdivisiones_politicas FOREIGN KEY (pais_codigo, division_politica_codigo) REFERENCES public.divisiones_politicas(pais_codigo, division_politica_codigo);


--
-- Name: costos_habitacion fhabitaciones_costoshabitacion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.costos_habitacion
    ADD CONSTRAINT fhabitaciones_costoshabitacion FOREIGN KEY (hotel_codigo, nro_habitacion) REFERENCES public.habitaciones(hotel_codigo, nro_habitacion);


--
-- Name: estadias_anteriores fhabitaciones_estadias_anteriores; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estadias_anteriores
    ADD CONSTRAINT fhabitaciones_estadias_anteriores FOREIGN KEY (hotel_codigo, nro_habitacion) REFERENCES public.habitaciones(hotel_codigo, nro_habitacion);


--
-- Name: reservas_anteriores fhabitaciones_reservas_anteriores; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas_anteriores
    ADD CONSTRAINT fhabitaciones_reservas_anteriores FOREIGN KEY (hotel_codigo, nro_habitacion) REFERENCES public.habitaciones(hotel_codigo, nro_habitacion);


--
-- Name: habitaciones fhoteles_habitaciones; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.habitaciones
    ADD CONSTRAINT fhoteles_habitaciones FOREIGN KEY (hotel_codigo) REFERENCES public.hoteles(hotel_codigo);


--
-- Name: clientes focupaciones_clientes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT focupaciones_clientes FOREIGN KEY (ocupacion_codigo) REFERENCES public.ocupaciones(ocupacion_codigo);


--
-- Name: divisiones_politicas fpaises; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.divisiones_politicas
    ADD CONSTRAINT fpaises FOREIGN KEY (pais_codigo) REFERENCES public.paises(pais_codigo);


--
-- Name: limitan fpaises1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.limitan
    ADD CONSTRAINT fpaises1 FOREIGN KEY (pais1_codigo) REFERENCES public.paises(pais_codigo);


--
-- Name: limitan fpaises2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.limitan
    ADD CONSTRAINT fpaises2 FOREIGN KEY (pais2_codigo) REFERENCES public.paises(pais_codigo);


--
-- Name: habitaciones ftiposhabitacion_habitaciones; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.habitaciones
    ADD CONSTRAINT ftiposhabitacion_habitaciones FOREIGN KEY (tipo_habitacion_codigo) REFERENCES public.tipos_habitacion(tipo_habitacion_codigo);


--
-- PostgreSQL database dump complete
--

