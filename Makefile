.PHONY: smoke

smoke:
	bash scripts/prepare_test_repo.sh
	bash tests/smoke/test_push_main.sh
	bash tests/smoke/test_push_feature.sh.PHONY: smoke.PHONY: smoke



smoke:smoke:

	bash scripts/prepare_test_repo.sh	bash scripts/prepare_test_repo.sh

	bash tests/smoke/test_push_main.sh	bash tests/smoke/test_push_main.sh

	bash tests/smoke/test_push_feature.sh	bash tests/smoke/test_push_feature.sh


