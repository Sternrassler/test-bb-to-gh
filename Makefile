.PHONY: smoke

smoke:
	bash scripts/prepare_test_repo.sh
	bash tests/smoke/test_push_main.sh
	bash tests/smoke/test_push_feature.sh
