--
-- Copyright (C) 2019 Oever González <notengobattery@gmail.com>
--
-- Licensed to the public under the Apache License 2.0.
--

module("luci.controller.admin.compressed_memory", package.seeall)

function index()
	entry({"admin", "system", "compressed_memory"}, view("compressed_memory"), _("Compressed memory"), 51)
		.file_depends = { "/etc/config/compressed_memory" }
end
