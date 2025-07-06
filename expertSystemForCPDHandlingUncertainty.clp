(deffunction MAIN::obtenerprobTempAlta (?p0 ?p1))

(deffunction MAIN::obtenerprobSOInestable (?p0 ?p1 ?p2))

(deffunction MAIN::obtenerprobCPUAlta (?p0))

(deffunction MAIN::obtenerprobRAMError (?p0))

(deffunction MAIN::obtenerprobCaidaServer (?p0 ?p1 ?p2 ?p3))

(deffunction MAIN::obtenerprobDiscError (?p0))

(deffunction MAIN::obtenerprobReinicio (?p0 ?p1 ?p2))

(deffunction MAIN::generar-booleanos (?p0))

(deffunction MAIN::caida-servidor-inferencia (?p0))

(deffunction MAIN::reinicio-inferencia (?p0))

(deffunction MAIN::temp-alta-inferencia (?p0))

(deffunction MAIN::soinestable-inferencia (?p0))

(deftemplate MAIN::evidencia
   (slot nombre)
   (slot booleano))

(deftemplate MAIN::consulta
   (slot nombre)
   (slot booleano))

(deftemplate MAIN::probRAMError
   (slot value)
   (slot probabilidad))

(deftemplate MAIN::probReinicio
   (slot rein)
   (slot ram)
   (slot temper)
   (slot probabilidad))

(deftemplate MAIN::probCaidaServer
   (slot caida)
   (slot rein)
   (slot so)
   (slot temper)
   (slot probabilidad))

(deftemplate MAIN::probDiscError
   (slot value)
   (slot probabilidad))

(deftemplate MAIN::probTempAlta
   (slot temper)
   (slot cpu)
   (slot probabilidad))

(deftemplate MAIN::probSOInestable
   (slot so)
   (slot cpu)
   (slot disco)
   (slot probabilidad))

(deftemplate MAIN::probCPUAlta
   (slot value)
   (slot probabilidad))

(deftemplate MAIN::valorRAMError
   (slot estado))

(deftemplate MAIN::valorTemperaturaAlta
   (slot estado))

(deftemplate MAIN::valorCPUalta
   (slot estado))

(deftemplate MAIN::valorReinicio
   (slot estado))

(deftemplate MAIN::valorSOInestable
   (slot estado))

(deftemplate MAIN::valorDiscoError
   (slot estado))

(deffacts MAIN::datosiniciales
   (valorCPUalta (estado nodefinido))
   (valorDiscoError (estado nodefinido))
   (valorRAMError (estado nodefinido))
   (valorTemperaturaAlta (estado nodefinido))
   (valorReinicio (estado nodefinido))
   (valorSOInestable (estado nodefinido))
   (probDiscError (value TRUE) (probabilidad 0.1))
   (probDiscError (value FALSE) (probabilidad 0.9))
   (probCPUAlta (value TRUE) (probabilidad 0.3))
   (probCPUAlta (value FALSE) (probabilidad 0.7))
   (probRAMError (value TRUE) (probabilidad 0.15))
   (probRAMError (value FALSE) (probabilidad 0.85))
   (probTempAlta (temper TRUE) (cpu TRUE) (probabilidad 0.8))
   (probTempAlta (temper TRUE) (cpu FALSE) (probabilidad 0.1))
   (probTempAlta (temper FALSE) (cpu TRUE) (probabilidad 0.2))
   (probTempAlta (temper FALSE) (cpu FALSE) (probabilidad 0.9))
   (probSOInestable (so TRUE) (cpu TRUE) (disco TRUE) (probabilidad 0.95))
   (probSOInestable (so TRUE) (cpu TRUE) (disco FALSE) (probabilidad 0.9))
   (probSOInestable (so TRUE) (cpu FALSE) (disco TRUE) (probabilidad 0.6))
   (probSOInestable (so TRUE) (cpu FALSE) (disco FALSE) (probabilidad 0.2))
   (probSOInestable (so FALSE) (cpu TRUE) (disco TRUE) (probabilidad 0.05))
   (probSOInestable (so FALSE) (cpu TRUE) (disco FALSE) (probabilidad 0.1))
   (probSOInestable (so FALSE) (cpu FALSE) (disco TRUE) (probabilidad 0.4))
   (probSOInestable (so FALSE) (cpu FALSE) (disco FALSE) (probabilidad 0.8))
   (probReinicio (rein TRUE) (ram TRUE) (temper TRUE) (probabilidad 0.9))
   (probReinicio (rein TRUE) (ram TRUE) (temper FALSE) (probabilidad 0.75))
   (probReinicio (rein TRUE) (ram FALSE) (temper TRUE) (probabilidad 0.7))
   (probReinicio (rein TRUE) (ram FALSE) (temper FALSE) (probabilidad 0.1))
   (probReinicio (rein FALSE) (ram TRUE) (temper TRUE) (probabilidad 0.1))
   (probReinicio (rein FALSE) (ram TRUE) (temper FALSE) (probabilidad 0.25))
   (probReinicio (rein FALSE) (ram FALSE) (temper TRUE) (probabilidad 0.3))
   (probReinicio (rein FALSE) (ram FALSE) (temper FALSE) (probabilidad 0.9))
   (probCaidaServer (caida TRUE) (rein TRUE) (so TRUE) (temper TRUE) (probabilidad 0.98))
   (probCaidaServer (caida TRUE) (rein TRUE) (so TRUE) (temper FALSE) (probabilidad 0.95))
   (probCaidaServer (caida TRUE) (rein TRUE) (so FALSE) (temper TRUE) (probabilidad 0.85))
   (probCaidaServer (caida TRUE) (rein TRUE) (so FALSE) (temper FALSE) (probabilidad 0.75))
   (probCaidaServer (caida TRUE) (rein FALSE) (so TRUE) (temper TRUE) (probabilidad 0.7))
   (probCaidaServer (caida TRUE) (rein FALSE) (so TRUE) (temper FALSE) (probabilidad 0.5))
   (probCaidaServer (caida TRUE) (rein FALSE) (so FALSE) (temper TRUE) (probabilidad 0.3))
   (probCaidaServer (caida TRUE) (rein FALSE) (so FALSE) (temper FALSE) (probabilidad 0.01))
   (probCaidaServer (caida FALSE) (rein TRUE) (so TRUE) (temper TRUE) (probabilidad 0.02))
   (probCaidaServer (caida FALSE) (rein TRUE) (so TRUE) (temper FALSE) (probabilidad 0.05))
   (probCaidaServer (caida FALSE) (rein TRUE) (so FALSE) (temper TRUE) (probabilidad 0.15))
   (probCaidaServer (caida FALSE) (rein TRUE) (so FALSE) (temper FALSE) (probabilidad 0.25))
   (probCaidaServer (caida FALSE) (rein FALSE) (so TRUE) (temper TRUE) (probabilidad 0.3))
   (probCaidaServer (caida FALSE) (rein FALSE) (so TRUE) (temper FALSE) (probabilidad 0.5))
   (probCaidaServer (caida FALSE) (rein FALSE) (so FALSE) (temper TRUE) (probabilidad 0.7))
   (probCaidaServer (caida FALSE) (rein FALSE) (so FALSE) (temper FALSE) (probabilidad 0.99)))

(deffunction MAIN::obtenerprobTempAlta
   (?temper ?cpu)
   (bind ?captura (find-fact ((?f probTempAlta))
      (and (eq ?f:temper ?temper) (eq ?f:cpu ?cpu))))
   (if (neq ?captura nil)
      then
      (fact-slot-value (nth$ 1 ?captura) probabilidad)
      else
      0.0))

(deffunction MAIN::obtenerprobSOInestable
   (?so ?cpu ?disco)
   (bind ?captura (find-fact ((?f probSOInestable))
      (and (eq ?f:so ?so) (eq ?f:cpu ?cpu) (eq ?f:disco ?disco))))
   (if (neq ?captura nil)
      then
      (fact-slot-value (nth$ 1 ?captura) probabilidad)
      else
      0.0))

(deffunction MAIN::obtenerprobCPUAlta
   (?value)
   (bind ?captura (find-fact ((?f probCPUAlta))
      (eq ?f:value ?value)))
   (if (neq ?captura nil)
      then
      (fact-slot-value (nth$ 1 ?captura) probabilidad)
      else
      0.0))

(deffunction MAIN::obtenerprobRAMError
   (?value)
   (bind ?captura (find-fact ((?f probRAMError))
      (eq ?f:value ?value)))
   (if (neq ?captura nil)
      then
      (fact-slot-value (nth$ 1 ?captura) probabilidad)
      else
      0.0))

(deffunction MAIN::obtenerprobCaidaServer
   (?caida ?rein ?so ?temper)
   (bind ?captura (find-fact ((?f probCaidaServer))
      (and (eq ?f:caida ?caida) (eq ?f:rein ?rein) (eq ?f:so ?so) (eq ?f:temper ?temper))))
   (if (neq ?captura nil)
      then
      (fact-slot-value (nth$ 1 ?captura) probabilidad)
      else
      0.0))

(deffunction MAIN::obtenerprobDiscError
   (?value)
   (bind ?captura (find-fact ((?f probDiscError))
      (eq ?f:value ?value)))
   (if (neq ?captura nil)
      then
      (fact-slot-value (nth$ 1 ?captura) probabilidad)
      else
      0.0))

(deffunction MAIN::obtenerprobReinicio
   (?rein ?ram ?temper)
   (bind ?captura (find-fact ((?f probReinicio))
      (and (eq ?f:rein ?rein) (eq ?f:ram ?ram) (eq ?f:temper ?temper))))
   (if (neq ?captura nil)
      then
      (fact-slot-value (nth$ 1 ?captura) probabilidad)
      else
      0.0))

(deffunction MAIN::generar-booleanos
   (?estado)
   (if (eq ?estado nodefinido)
      then
      (create$ TRUE FALSE)
      else
      (if (eq ?estado TRUE)
         then
         (create$ TRUE)
         else
         (create$ FALSE))))

(deffunction MAIN::caida-servidor-inferencia
   (?booleano-objetivo)
   (bind ?objetivo 0.0)
   (bind ?total 0.0)
   (bind ?cpu-fact (nth$ 1 (find-all-facts ((?f valorCPUalta))
      TRUE)))
   (bind ?ram-fact (nth$ 1 (find-all-facts ((?f valorRAMError))
      TRUE)))
   (bind ?disco-fact (nth$ 1 (find-all-facts ((?f valorDiscoError))
      TRUE)))
   (bind ?temper-fact (nth$ 1 (find-all-facts ((?f valorTemperaturaAlta))
      TRUE)))
   (bind ?rein-fact (nth$ 1 (find-all-facts ((?f valorReinicio))
      TRUE)))
   (bind ?so-fact (nth$ 1 (find-all-facts ((?f valorSOInestable))
      TRUE)))
   (bind ?cpu_estado (fact-slot-value ?cpu-fact estado))
   (bind ?ram_estado (fact-slot-value ?ram-fact estado))
   (bind ?disk_estado (fact-slot-value ?disco-fact estado))
   (bind ?temp_estado (fact-slot-value ?temper-fact estado))
   (bind ?rein_estado (fact-slot-value ?rein-fact estado))
   (bind ?so_estado (fact-slot-value ?so-fact estado))
   (bind ?lista-cpu (generar-booleanos ?cpu_estado))
   (bind ?lista-ram (generar-booleanos ?ram_estado))
   (bind ?lista-disco (generar-booleanos ?disk_estado))
   (bind ?lista-temper (generar-booleanos ?temp_estado))
   (bind ?lista-rein (generar-booleanos ?rein_estado))
   (bind ?lista-so (generar-booleanos ?so_estado))
   (foreach ?cpu ?lista-cpu
      (foreach ?ram ?lista-ram
         (foreach ?disco ?lista-disco
            (foreach ?temper ?lista-temper
               (foreach ?rein ?lista-rein
                  (foreach ?so ?lista-so
                     (foreach ?caida (create$ TRUE FALSE)
                        (bind ?p_asig (* (obtenerprobCPUAlta ?cpu) (obtenerprobRAMError ?ram) (obtenerprobDiscError ?disco) (obtenerprobTempAlta ?temper ?cpu) (obtenerprobReinicio ?rein ?ram ?temper) (obtenerprobSOInestable ?so ?cpu ?disco) (obtenerprobCaidaServer ?caida ?rein ?so ?temper)))
                        (bind ?total (+ ?total ?p_asig))
                        (if (eq ?caida ?booleano-objetivo)
                           then
                           (bind ?objetivo (+ ?objetivo ?p_asig))))))))))
   (bind ?posterior (/ ?objetivo ?total))
   (printout t "Prob. de CaidaServidor (" ?booleano-objetivo ") seg£n s¡ntomas presentes: " ?posterior crlf))

(deffunction MAIN::reinicio-inferencia
   (?booleano-objetivo)
   (bind ?objetivo 0.0)
   (bind ?total 0.0)
   (bind ?cpu-fact (nth$ 1 (find-all-facts ((?f valorCPUalta))
      TRUE)))
   (bind ?ram-fact (nth$ 1 (find-all-facts ((?f valorRAMError))
      TRUE)))
   (bind ?temper-fact (nth$ 1 (find-all-facts ((?f valorTemperaturaAlta))
      TRUE)))
   (bind ?cpu_estado (fact-slot-value ?cpu-fact estado))
   (bind ?ram_estado (fact-slot-value ?ram-fact estado))
   (bind ?temp_estado (fact-slot-value ?temper-fact estado))
   (bind ?lista-cpu (generar-booleanos ?cpu_estado))
   (bind ?lista-ram (generar-booleanos ?ram_estado))
   (bind ?lista-temper (generar-booleanos ?temp_estado))
   (foreach ?cpu ?lista-cpu
      (foreach ?ram ?lista-ram
         (foreach ?temper ?lista-temper
            (foreach ?rein (create$ TRUE FALSE)
               (bind ?p_asig (* (obtenerprobCPUAlta ?cpu) (obtenerprobRAMError ?ram) (obtenerprobTempAlta ?temper ?cpu) (obtenerprobReinicio ?rein ?ram ?temper)))
               (bind ?total (+ ?total ?p_asig))
               (if (eq ?rein ?booleano-objetivo)
                  then
                  (bind ?objetivo (+ ?objetivo ?p_asig)))))))
   (bind ?posterior (/ ?objetivo ?total))
   (printout t "Prob. de Reinicio (" ?booleano-objetivo ") seg£n s¡ntomas presentes: " ?posterior crlf))

(deffunction MAIN::temp-alta-inferencia
   (?booleano-objetivo)
   (bind ?objetivo 0.0)
   (bind ?total 0.0)
   (bind ?cpu-fact (nth$ 1 (find-all-facts ((?f valorCPUalta))
      TRUE)))
   (bind ?cpu_estado (fact-slot-value ?cpu-fact estado))
   (bind ?lista-cpu (generar-booleanos ?cpu_estado))
   (foreach ?cpu ?lista-cpu
      (foreach ?temper (create$ TRUE FALSE)
         (bind ?p_asig (* (obtenerprobCPUAlta ?cpu) (obtenerprobTempAlta ?temper ?cpu)))
         (bind ?total (+ ?total ?p_asig))
         (if (eq ?temper ?booleano-objetivo)
            then
            (bind ?objetivo (+ ?objetivo ?p_asig)))))
   (bind ?posterior (/ ?objetivo ?total))
   (printout t "Prob. de Temperatura Alta (" ?booleano-objetivo ") seg£n s¡ntomas presentes: " ?posterior crlf))

(deffunction MAIN::soinestable-inferencia
   (?booleano-objetivo)
   (bind ?objetivo 0.0)
   (bind ?total 0.0)
   (bind ?cpu-fact (nth$ 1 (find-all-facts ((?f valorCPUalta))
      TRUE)))
   (bind ?disco-fact (nth$ 1 (find-all-facts ((?f valorDiscoError))
      TRUE)))
   (bind ?cpu_estado (fact-slot-value ?cpu-fact estado))
   (bind ?disk_estado (fact-slot-value ?disco-fact estado))
   (bind ?lista-cpu (generar-booleanos ?cpu_estado))
   (bind ?lista-disco (generar-booleanos ?disk_estado))
   (foreach ?cpu ?lista-cpu
      (foreach ?disco ?lista-disco
         (foreach ?so (create$ TRUE FALSE)
            (bind ?p_asig (* (obtenerprobCPUAlta ?cpu) (obtenerprobDiscError ?disco) (obtenerprobSOInestable ?so ?cpu ?disco)))
            (bind ?total (+ ?total ?p_asig))
            (if (eq ?so ?booleano-objetivo)
               then
               (bind ?objetivo (+ ?objetivo ?p_asig))))))
   (bind ?posterior (/ ?objetivo ?total))
   (printout t "Prob. de S.O Inestable (" ?booleano-objetivo ") seg£n s¡ntomas presentes: " ?posterior crlf))

(defrule MAIN::definirRAMError
   ?f <- (valorRAMError (estado nodefinido))
   ?evidencia <- (evidencia (nombre RAMError) (booleano ?v))
   =>
   (if (eq ?v TRUE)
      then
      (modify ?f (estado TRUE))
      (retract ?evidencia)
      else
      (modify ?f (estado FALSE))
      (retract ?evidencia)))

(defrule MAIN::definirDiscoError
   ?f <- (valorDiscoError (estado nodefinido))
   ?evidencia <- (evidencia (nombre DiscoError) (booleano ?v))
   =>
   (if (eq ?v TRUE)
      then
      (modify ?f (estado TRUE))
      (retract ?evidencia)
      else
      (modify ?f (estado FALSE))
      (retract ?evidencia)))

(defrule MAIN::definirTempAlta
   ?f <- (valorTemperaturaAlta (estado nodefinido))
   ?evidencia <- (evidencia (nombre TempAlta) (booleano ?v))
   =>
   (if (eq ?v TRUE)
      then
      (modify ?f (estado TRUE))
      (retract ?evidencia)
      else
      (modify ?f (estado FALSE))
      (retract ?evidencia)))

(defrule MAIN::definirCPUAlta
   ?f <- (valorCPUalta (estado nodefinido))
   ?evidencia <- (evidencia (nombre CPUAlta) (booleano ?v))
   =>
   (if (eq ?v TRUE)
      then
      (modify ?f (estado TRUE))
      (retract ?evidencia)
      else
      (modify ?f (estado FALSE))
      (retract ?evidencia)))

(defrule MAIN::definirReinicio
   ?f <- (valorReinicio (estado nodefinido))
   ?evidencia <- (evidencia (nombre Reinicio) (booleano ?v))
   =>
   (if (eq ?v TRUE)
      then
      (modify ?f (estado TRUE))
      (retract ?evidencia)
      else
      (modify ?f (estado FALSE))
      (retract ?evidencia)))

(defrule MAIN::definirSOInestable
   ?f <- (valorSOInestable (estado nodefinido))
   ?evidencia <- (evidencia (nombre SOInestable) (booleano ?v))
   =>
   (if (eq ?v TRUE)
      then
      (modify ?f (estado TRUE))
      (retract ?evidencia)
      else
      (modify ?f (estado FALSE))
      (retract ?evidencia)))

(defrule MAIN::output
   ?query <- (consulta (nombre ?n) (booleano ?v))
   =>
   (if (eq Reinicio ?n)
      then
      (reinicio-inferencia ?v)
      (retract ?query))
   (if (eq TempAlta ?n)
      then
      (temp-alta-inferencia ?v)
      (retract ?query))
   (if (eq CaidaServidor ?n)
      then
      (caida-servidor-inferencia ?v)
      (retract ?query))
   (if (eq SOInestable ?n)
      then
      (soinestable-inferencia ?v)
      (retract ?query)))

