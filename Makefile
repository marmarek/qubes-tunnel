VERSION := $(shell cat version)

install: install-vm

install-vm:
	install -d  $(DESTDIR)/usr/lib/qubes/
	install -D qtunnel-setup $(DESTDIR)/usr/lib/qubes/qtunnel-setup
	install -D qtunnel-connect $(DESTDIR)/usr/lib/qubes/qtunnel-connect
	install -D tunnel-restrict-firewall $(DESTDIR)/usr/lib/qubes/tunnel-restrict-firewall
	install -d $(DESTDIR)/lib/systemd/system
	install -D qubes-tunnel.service $(DESTDIR)/lib/systemd/system/qubes-tunnel.service
	install -d $(DESTDIR)/lib/systemd/system/qubes-tunnel.service.d
	install -D 00_generic.example $(DESTDIR)/lib/systemd/system/qubes-tunnel.service.d/00_generic.example
	install -D 10_wg.example  $(DESTDIR)/lib/systemd/system/qubes-tunnel.service.d/10_wg.example
	groupadd -rf qtunnel
	systemctl daemon-reload
	systemctl enable qubes-tunnel.service
